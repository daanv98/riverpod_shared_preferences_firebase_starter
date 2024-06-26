import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_shared_preferences_firebase_starter/providers/shared_preferences_provider.dart';
import 'package:riverpod_shared_preferences_firebase_starter/providers/theme_provider.dart';
import 'package:riverpod_shared_preferences_firebase_starter/utils/themes.dart';
import 'package:riverpod_shared_preferences_firebase_starter/views/auth_wrapper.dart';
import 'package:riverpod_shared_preferences_firebase_starter/views/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // TODO: Set up a Firebase project with Firebase Authentication and configure the project using the FlutterFire CLI. Afterward, initialize Firebase by uncommenting the code below.
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Riverpod - Shared preferences - Firebase starter app',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,

      // TODO: Replace HomePage with AuthWrapper for initial screen
      home: const HomePage(),
    );
  }
}
