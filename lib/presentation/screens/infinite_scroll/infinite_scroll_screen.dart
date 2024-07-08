import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

const imagesLoadIncrease = 5;

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  int imagesNumber = imagesLoadIncrease, lastImagesNumber = imagesLoadIncrease;
  List<int> imageIds = [1, 2, 3, 4, 5];
  bool isLoading = false;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    print('Is loading is false');
    isLoading = true;
    setState(() {}); // isLoading is updated

    await Future.delayed(const Duration(seconds: 2));

    addFiveIds();
    isLoading = false;

    // It is wrong to call set state if [dispose] has already been called
    if (!mounted) return;

    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    lastImagesNumber = imagesNumber;
    imagesNumber++;
    // addImagesNumber(increase: imagesLoadIncrease - 1);
    final lastImage = imageIds.last;
    imageIds.clear();
    imageIds.add(lastImage + 1);

    addFiveIds();

    setState(() => isLoading = false);
  }

  void moveScrollToBottom() {
    final double currentPosition = scrollController.position.pixels;

    if (currentPosition + 150 <= scrollController.position.maxScrollExtent)
      return;

    scrollController.animateTo(
      currentPosition + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  void addFiveIds() {
    final lastId = imageIds.last;
    imageIds.addAll([1, 2, 3, 4, 5].map((e) => e + lastId));
  }

  void addImagesNumber({int increase = imagesLoadIncrease}) {
    imagesNumber += increase;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            isLoading
                ? FadeIn(
                    duration: const Duration(seconds: 1),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 25),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : const SizedBox(),
            RefreshIndicator(
              edgeOffset: 10,
              strokeWidth: 2,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imageIds.length,
                itemBuilder: (BuildContext context, int index) {
                  final networkImage = NetworkImage(
                      'https://picsum.photos/id/${imageIds[index]}/800/600');
                  return FadeInImage(
                    fit: BoxFit.cover,
                    width: size.width,
                    placeholder:
                        const AssetImage('assets/images/jar-loading.gif'),
                    image: networkImage,
                    imageErrorBuilder: (BuildContext context, error,
                            stackTrace) =>
                        Image.asset('assets/images/1.png', fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.pop,
        child: const Icon(Icons.home_filled),
      ),
    );
  }
}
