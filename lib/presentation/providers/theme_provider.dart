import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

/// The available colors, uses a reference of the colors in AppTheme
final List<Color> _colors = AppTheme().themesColors;

/// An AppTheme object for related actions
AppTheme _appTheme = AppTheme(selectedColor: 0);

class ThemeProvider extends ChangeNotifier {
  Color? _colorSeed = _appTheme.currentColor;
  ThemeData _themeData = _appTheme.getTheme();
  ThemeData _darkThemeData = _appTheme.getDarkTheme();
  ThemeMode _themeMode = ThemeMode.light;

  /// Changes the theme to the given themeData. Brightness will be according to the themeMode of this provider. Changing the theme by this way, will set [colorSeed] to null. If you want to change according to a [colorSeed] use the [colorSeed] setter and the theme will change too
  Future<void> changeTheme(ThemeData themeData) async {
    _colorSeed = null;

    final Color primary = themeData.colorScheme.primary;
    _appTheme = AppTheme.fromColor(customColor: primary);

    if (_themeMode == ThemeMode.dark || _themeMode == ThemeMode.light) {
      _darkThemeData = _appTheme.getDarkTheme();
      _themeData = _appTheme.getTheme();
    } else {
      _themeData = themeData;
    }
    notifyListeners();
  }

  void _changeThemeWithColorSeed(ThemeData themeData, Color colorSeed) {
    // Changing the order will make _colorSeed to be null due to the [changeTheme] behavior
    changeTheme(themeData);
    _colorSeed = colorSeed;
    // notifyListeners(); // No need for now :)
  }

  /// Sets the themeMode if given. Otherwise, switches between light and dark. If the current themeMode is ThemeMode.system, then there won't be any changes.
  Future<void> changeThemeMode({ThemeMode? themeMode}) async {
    if (themeMode == _themeMode) return;
    if (themeMode != null) {
      _themeMode = themeMode;
    } else {
      _themeMode = _themeMode == ThemeMode.system
          ? ThemeMode.system
          : (_themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
    }
    notifyListeners();
  }

  ThemeData get themeData {
    return _themeData;
  }

  ThemeData get darkThemeData {
    return _darkThemeData;
  }

  ThemeMode get themeMode {
    return _themeMode;
  }

  /// The available colors, uses a reference of the colors in AppTheme
  List<Color> get themesColors {
    return _colors;
  }

  set colorSeed(Color? color) {
    color = color ?? _appTheme.currentColor;
    _changeThemeWithColorSeed(
        AppTheme.fromColor(customColor: color).getTheme(), color);
  }

  /// Returns the colorSeed used for the current [themeData], returns null if no colorSeed was used
  Color? get colorSeed {
    return _colorSeed;
  }
}
