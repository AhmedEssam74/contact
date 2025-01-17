import 'package:contact/Themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightTheme extends BaseTheme {
  @override
  Color get primaryColor => const Color(0xff29384D);

  @override
  static Color get secondaryColor => const Color(0xffFFF1D4);

  @override
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        cardColor: const Color(0xffF93E3E),
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: false,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        textTheme: TextTheme(
          titleSmall: GoogleFonts.aclonica(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            color: LightTheme.secondaryColor,
          ),
          titleMedium: GoogleFonts.aclonica(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
          bodySmall: GoogleFonts.aclonica(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
          bodyMedium: GoogleFonts.aclonica(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
      );
}
