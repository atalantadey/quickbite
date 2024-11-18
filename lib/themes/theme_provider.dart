import 'package:flutter/material.dart';
import 'package:quickbite/themes/dark_mode.dart';
import 'package:quickbite/themes/light_mode.dart';

ThemeData _themeData = lightMode;

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  //initially light mode

  //get current theme
  ThemeData get themeData => _themeData;

  //check if current theme is darkMode?
  bool get isDarkMode => _themeData == darkMode;

  //setTheme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
