import 'package:contact/my_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: MyTheme.primaryColor,
        title: Image.asset(
          "assets/images/logo.png",
          scale: 1.5,
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hallo",
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
