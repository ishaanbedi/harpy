import 'package:flutter/material.dart';

class RetryAuthenticationDialog extends StatelessWidget {
  const RetryAuthenticationDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('login'),
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: const Text(
        'unable to initialize user\n\n'
        'please check your connection and try again',
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('retry'),
        ),
      ],
    );
  }
}