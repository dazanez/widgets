import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool darkThemeActive = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    darkThemeActive = context.read<ThemeProvider>().themeMode == ThemeMode.dark;
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: darkThemeActive,
          title: const Text('Activate dark theme'),
          subtitle: const Text('Switch dark and light theme of the app'),
          onChanged: (isDarkMode) {
            context.read<ThemeProvider>().changeThemeMode(
                themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light);
            setState(() {
              darkThemeActive = !darkThemeActive;
            });
          },
        ),
      ],
    );
  }
}
