import 'package:contact/Themes/light_theme.dart';
import 'package:contact/screens/home_screen.dart';
import 'package:contact/Themes/my_theme.dart';
import 'package:contact/screens/splash_screen.dart';
import 'package:contact/screens/widgets/contact_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseTheme lightTheme = LightTheme();
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routName,
        theme: lightTheme.themeData,
        routes: {
          SplashScreen.routName: (context) => const SplashScreen(),
          HomeScreen.routName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
