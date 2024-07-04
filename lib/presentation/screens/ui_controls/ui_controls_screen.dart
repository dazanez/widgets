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

class _UiControlsViewState extends State<_UiControlsView> {
  bool darkThemeActive = true;
  Color selectedColor = Colors.blue;
  bool wantsBreakfast = false, wantsLunch = false, wantsMeal = false;

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.watch<ThemeProvider>();
    final List<Color> themesColors = themeProvider.themesColors;

    darkThemeActive = themeProvider.themeMode == ThemeMode.dark;
    selectedColor = themeProvider.colorSeed ?? selectedColor;

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: darkThemeActive,
          title: const Text('Activate dark theme'),
          subtitle: const Text('Switch dark and light theme of the app'),
          onChanged: (isDarkMode) => setState(() {
            themeProvider.changeThemeMode(
                themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light);
            darkThemeActive = !darkThemeActive;
          }),
        ),
        ExpansionTile(
          title: const Text('Select a color theme'),
          subtitle: Text('Selected color: ${selectedColor.value}'),
          leading: Icon(
            Icons.square_rounded,
            color: selectedColor,
          ),
          children: [
            ...themesColors.map((color) => RadioListTile(
                title: Text('Color: ${color.value}'),
                secondary: Icon(
                  Icons.square_rounded,
                  color: color,
                ),
                value: color,
                groupValue: selectedColor,
                onChanged: (_) => setState(() {
                      selectedColor = color;
                      themeProvider.colorSeed = color;
                    }))),
            RadioListTile(
                title: const Text('Other color'),
                secondary: !themesColors.contains(selectedColor)
                    ? Icon(
                        Icons.square_rounded,
                        color: selectedColor,
                      )
                    : null,
                value: themesColors.contains(selectedColor)
                    ? Colors.transparent
                    : selectedColor,
                groupValue: selectedColor,
                onChanged: null)
          ],
        ),
        CheckboxListTile(
            title: const Text('Include breakfast'),
            value: wantsBreakfast,
            onChanged: (_) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text('Include lunch'),
            value: wantsLunch,
            onChanged: (_) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text('Include meal'),
            value: wantsMeal,
            onChanged: (_) => setState(() {
                  wantsMeal = !wantsMeal;
                })),
      ],
    );
  }
}
