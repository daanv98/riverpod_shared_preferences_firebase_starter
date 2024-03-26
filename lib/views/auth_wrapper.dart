import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_shared_preferences_firebase_starter/views/pages/error/error_page.dart';
import 'package:riverpod_shared_preferences_firebase_starter/views/pages/home/home_page.dart';
import 'package:riverpod_shared_preferences_firebase_starter/views/pages/loading/loading_page.dart';
import 'package:riverpod_shared_preferences_firebase_starter/views/pages/login/login_page.dart';

import '../providers/auth_state_changes_provider.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
        data: (user) => user != null ? const HomePage() : const LoginPage(),
        loading: () => const LoadingPage(),
        error: (error, stack) => ErrorPage(error: error.toString()));
  }
}
