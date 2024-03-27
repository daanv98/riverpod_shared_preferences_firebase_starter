import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/auth_service_provider.dart';
import '../../../../utils/dialog_manager.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;

  void _signIn() async {
    DialogManager.showLoadingDialog(context);

    final errorCode = await ref
        .read(authServiceProvider)
        .signIn(_emailController.text.trim(), _passwordController.text);

    if (!mounted) return;
    DialogManager.closeDialog(context);

    if (errorCode != null) {
      DialogManager.showErrorDialog(context, errorCode);
    }
  }

  void _toggleHidePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(label: Text('Email')),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                label: const Text('Password'),
                suffixIcon: IconButton(
                  icon: _hidePassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: _toggleHidePassword,
                ),
              ),
              obscureText: _hidePassword,
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: _signIn, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
