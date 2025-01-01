import 'package:contact/home_screen.dart';
import 'package:contact/splash_screen.dart';
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
      initialRoute: SplashScreen.routName,
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      routes: {
        SplashScreen.routName: (context) => const SplashScreen(),
        HomeScreen.routName: (context) => const HomeScreen(),
      },
    );
  }
}
