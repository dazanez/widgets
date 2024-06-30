import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = AppTheme(selectedColor: 0).getTheme();
  ThemeMode _themeMode = ThemeMode.light;
  ThemeData _darkThemeData = AppTheme(selectedColor: 0).getDarkTheme();

  /// Changes the theme to the given themeData. Brightness will be according to the themeMode of this provider
  Future<void> changeTheme(ThemeData themeData) async {
    if (_themeMode == ThemeMode.dark) {
      _darkThemeData = themeData.copyWith(brightness: Brightness.dark);
    } else if (_themeMode == ThemeMode.light) {
      _themeData = themeData.copyWith(brightness: Brightness.light);
    } else {
      _themeData = themeData;
    }
    notifyListeners();
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

  get themeData {
    return _themeData;
  }

  get darkThemeData {
    return _darkThemeData;
  }

  get themeMode {
    return _themeMode;
  }
}
