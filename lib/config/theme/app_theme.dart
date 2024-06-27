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
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colors.length,
            'There are only ${colors.length} colors, you can select up to ${colors.length - 1} color index');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colors[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false, 
    ),
  );
}
