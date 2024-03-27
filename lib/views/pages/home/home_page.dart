import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_shared_preferences_firebase_starter/providers/auth_service_provider.dart';
import 'package:riverpod_shared_preferences_firebase_starter/utils/theme_mode_extension.dart';

import '../../../providers/theme_provider.dart';
import '../../../services/auth_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //TODO: Uncomment when Firebase Authentication is implemented.
    // final authService = ref.watch(authServiceProvider);
    final themeMode = ref.watch(themeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            TextButton.icon(
                onPressed: () => ref.read(authServiceProvider).signOut(),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'))
          ],
        ),
        body: Column(
          children: [

            // TODO: Uncomment when Firebase Authentication is implemented for retrieving user details.
            // ListTile(
            //   title: const Text('Email'),
            //   subtitle: Text(authService.user!.email!),
            // ),
            ListTile(
              title: const Text('Choose theme'),
              subtitle: Text(themeMode.modeName),
              onTap: () => ref.read(themeProvider.notifier).cycleTheme(),
            ),
          ],
        ));
  }
}
