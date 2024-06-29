import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double containerWidth = 60.0;
  double containerHeight = 30.0;
  double containerBorderRadius = 20.0;
  Color containerColor = Colors.blue;
  Curve curve = Curves.bounceOut;

  Map<String, dynamic> previousShape = {
    'containerWidth': 60.0,
    'containerHeight': 30.0,
    'containerBorderRadius': 20.0,
    'cotainerColor': Colors.blue
  };

  void changeShape(
      {double? width, double? height, double? borderRadius, Color? color}) {
    updatePreviousShape();
    final random = Random();

    containerWidth = width ?? random.nextInt(251) + 50;
    containerHeight = height ?? random.nextInt(251) + 50;
    containerBorderRadius = borderRadius ?? random.nextInt(50).toDouble();
    containerColor = color ??
        Color.fromRGBO(
            random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }

  void changeToPreviousShape() {
    changeShape(
        width: previousShape['containerWidth'] ?? containerWidth,
        height: previousShape['containerHeight'] ?? containerHeight,
        borderRadius:
            previousShape['containerBorderRadius'] ?? containerBorderRadius,
        color: previousShape['containerColor'] ?? containerColor);
  }

  void updatePreviousShape() {
    previousShape['containerWidth'] = containerWidth;
    previousShape['containerHeight'] = containerHeight;
    previousShape['containerBorderRadius'] = containerBorderRadius;
    previousShape['containerColor'] = containerColor;
  }

  void changeCurve(BuildContext context, {Curve? curve}) {
    final Random random = Random();
    const curves = <Curve>[
      Curves.decelerate,
      Curves.bounceOut,
      Curves.easeOutCubic,
      Curves.fastOutSlowIn,
      Curves.easeOutQuart
    ];

    this.curve = curve ?? curves[random.nextInt(curves.length)];
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Animation curve changed to ${this.curve}')));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: changeShape,
          child: AnimatedContainer(
            curve: curve,
            duration: const Duration(milliseconds: 350),
            width: containerWidth < 0 ? 0 : containerWidth,
            height: containerHeight < 0 ? 0 : containerHeight,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(
                  containerBorderRadius < 0 ? 0 : containerBorderRadius),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonChangeCurve',
              onPressed: () => changeCurve(context),
              child: const Icon(Icons.change_circle_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonPreviousShape',
              onPressed: changeToPreviousShape,
              child: const Icon(Icons.navigate_before_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FloatingActionButton(
              heroTag: 'floatingButtonChangeShape',
              onPressed: changeShape,
              child: const Icon(Icons.auto_fix_normal_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
