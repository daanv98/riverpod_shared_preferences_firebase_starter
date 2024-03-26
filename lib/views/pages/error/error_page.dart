import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    debugPrint(error);
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: SelectableText(error),
      ),
    );
  }
}
