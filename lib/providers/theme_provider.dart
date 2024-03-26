import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_shared_preferences_firebase_starter/providers/shared_preferences_provider.dart';

import '../services/theme_storage.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(() => ThemeNotifier());

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final ThemeStorage themeStorage = ThemeStorage(prefs);
    final currentValue = themeStorage.getThemeMode();
    ref.listenSelf((prev, curr) {
      themeStorage.setThemeMode(curr);
    });
    return currentValue;
  }

  void cycleTheme() {
    final int nextIndex = (state.index + 1) % ThemeMode.values.length;
    state = ThemeMode.values[nextIndex];
  }
}

