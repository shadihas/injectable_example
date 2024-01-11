import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable_example/router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Page"),
      ),
      body: Center(
          child: TextButton(
              onPressed: () {
                context.pushReplacementNamed(AppRoutesNames.home);
              },
              child: const Text("Go to Home Page"))),
    );
  }
}
