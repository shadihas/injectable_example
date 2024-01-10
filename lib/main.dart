import 'package:flutter/material.dart';
import 'package:injectable_example/application/services/screen.dart';
import 'package:injectable_example/injection.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const InjectableExample());
}

class InjectableExample extends StatelessWidget {
  const InjectableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
