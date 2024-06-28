import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          ...const [
            SizedBox(height: 30),
            Text('Circular progress indicator'),
            SizedBox(height: 15)
          ],
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: colors.surfaceVariant,
          ),
          ...const [
            SizedBox(height: 30),
            // El circulo se completa a partir del porcentaje de carga
            Text('Circular indicator controlado'),
            SizedBox(height: 15)
          ],
          _ControlledProgressIndicator(colors: colors),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300),
        (value) {
          return (value * 2) / 100;
        },
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final double progressValue = snapshot.data ?? 0;

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: colors.surfaceVariant,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                ))
              ],
            ));
      },
    );
  }
}
