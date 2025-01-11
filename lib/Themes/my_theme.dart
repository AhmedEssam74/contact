import 'package:flutter/material.dart';

abstract class BaseTheme {
  Color get primaryColor;

  static Color get secondaryColor {
    // TODO: implement secondaryColor
    throw UnimplementedError();
  }

  ThemeData get themeData;
}
