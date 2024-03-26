import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  final SharedPreferences _prefs;

  ThemeStorage(this._prefs);

  ThemeMode getThemeMode() {
    final int index = _prefs.getInt('themeMode') ?? 0;
    return ThemeMode.values[index];
  }

  void setThemeMode(ThemeMode themeMode) {
    _prefs.setInt('themeMode', themeMode.index);
  }
}
