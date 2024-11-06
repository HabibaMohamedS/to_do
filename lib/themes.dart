import 'package:flutter/material.dart';

class Themes {
  static ThemeData light = ThemeData(
      datePickerTheme: const DatePickerThemeData(
        headerBackgroundColor: Color(0xFF2296F3),
        headerForegroundColor: Colors.white,
        backgroundColor: Color(0xFFE6F3FD),
        dayForegroundColor: MaterialStatePropertyAll(Colors.black),
        dayStyle: TextStyle(color: Colors.blue),
        dayOverlayColor: MaterialStatePropertyAll(Colors.black),
        todayBackgroundColor: MaterialStatePropertyAll(Colors.blue),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black),
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
          displayMedium: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 25),
          displaySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.5)),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFDFECDB),
          onPrimary: Color(0xFFDFECDB),
          secondary: Color(0xFF5D9CEC),
          onSecondary: Color(0xFF5D9CEC),
          error: Color(0xFFEC4B4B),
          onError: Color(0xFFEC4B4B),
          background: Colors.white,
          onBackground: Colors.white,
          surface: Color(0xFF61E757),
          onSurface: Color(0xFF61E75)));
  static ThemeData dark = ThemeData(
      datePickerTheme: const DatePickerThemeData(
        headerBackgroundColor: Color(0xFF2296F3),
        headerForegroundColor: Colors.white,
        backgroundColor: Color(0xFF141922),
        dayForegroundColor: MaterialStatePropertyAll(Colors.white),
        dayStyle: TextStyle(color: Colors.blue),
        dayOverlayColor: MaterialStatePropertyAll(Colors.deepPurple),
        todayBackgroundColor: MaterialStatePropertyAll(Colors.blue),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
          displayMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
          displaySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.5)),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF060E1E),
          onPrimary: Color(0xFF060E1E),
          secondary: Color(0xFF5D9CEC),
          onSecondary: Color(0xFF5D9CEC),
          error: Color(0xFFEC4B4B),
          onError: Color(0xFFEC4B4B),
          background: Colors.white,
          onBackground: Color(0xFF141922),
          surface: Color(0xFF61E757),
          onSurface: Color(0xFF61E75)));
}
