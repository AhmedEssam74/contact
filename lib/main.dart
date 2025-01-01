import 'package:contact/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      routes: {
        HomeScreen.routName: (context) => const HomeScreen(),
      },
    );
  }
}
