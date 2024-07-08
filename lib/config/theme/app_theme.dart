import 'package:flutter/material.dart';

// Otra forma de definir un arreglo
const colors = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.indigo,
  Colors.yellow,
  Colors.lime,
  Colors.cyanAccent,
];

class AppTheme {
  final int _selectedColor;
  final Color? customColor;

  /// Prefer use [AppTheme.fromColor] as you can set a new theme from any color, instead of the limited colors that [AppTheme] gives
  AppTheme({int selectedColor = 1})
      : _selectedColor = selectedColor,
        assert(selectedColor >= 0 && selectedColor < colors.length,
            'There are only ${colors.length} colors, you can select up to ${colors.length - 1} color index'),
        customColor = null;

  AppTheme.fromColor({required Color this.customColor}) : _selectedColor = 0;

  ThemeData getTheme({bool toDark = false}) => ThemeData(
        useMaterial3: true,
        brightness: toDark ? Brightness.dark : Brightness.light,
        colorSchemeSeed: customColor ?? colors[_selectedColor],
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          }
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );

  ThemeData getDarkTheme() => getTheme(toDark: true);

  List<Color> get themesColors {
    return colors;
  }

  Color get currentColor {
    return colors[_selectedColor];
  }

  int get indexOfCurrentColor {
    return _selectedColor;
  }
}
