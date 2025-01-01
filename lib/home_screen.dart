import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hallo",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
