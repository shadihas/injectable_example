// import 'package:flutter/material.dart';
// import 'package:injectable_example/injection.dart';
// import 'package:injectable_example/router.dart';

// Future<void> main() async {
//   await configureDependencies();
//   runApp(const InjectableExample());
// }

// class InjectableExample extends StatefulWidget {
//   const InjectableExample({super.key});

//   @override
//   State<InjectableExample> createState() => _InjectableExampleState();
// }

// class _InjectableExampleState extends State<InjectableExample> {
//   final RoutesManager routesManager = RoutesManager();
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp.router(
//       routerConfig: routesManager.router,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:injectable_example/application/chat_bot/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Flow Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

