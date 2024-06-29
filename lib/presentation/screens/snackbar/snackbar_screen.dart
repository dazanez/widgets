import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final SnackBar snackbar = SnackBar(
      content: const Text('This is a Snackbar, isn\'t it?'),
      action: SnackBarAction(
        label: 'Home',
        onPressed: () => context.goNamed(HomeScreen.name),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Dialog title'),
        content: const Text(
            'This is a customized dialog, and this is an example parragraph that covers the content of the dialog.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Close'),
          ),
          FilledButton(
            onPressed: () => context.goNamed(HomeScreen.name),
            child: const Text('Go home'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    children: [
                      const Text(
                          'The licenses of the platforms and resources that make posible the running of this app are listed in the next screen.\n\nLas licencias de las plataformas y recursos que hacen posible el funcionamiento de esta app se listarán en la siguiente pantalla.'),
                    ],
                  );
                },
                child: const Text('Used Licences')),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
