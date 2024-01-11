import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Page One",
          style: TextStyle(color: Colors.black87, fontSize: 30),
        ), 
      ),
      body: Center( 
        child:Text(
          "Page One",
          style: TextStyle(color: Colors.black87, fontSize: 30),
        ),
      ),
    );
  }
}
