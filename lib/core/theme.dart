import 'package:flutter/material.dart';

class AppTheme {
  static const Color themeBgColor = Color(0xFFFB8647);
  static const Color themeBgColorLight = Color(0xFFF7DECB);
  static const Color buttonText = Color(0xFFF1F7F8);
  static const double inputBorderRadius = 10;
  static const Color inputBgColor = Color(0xFFFAFBFB);
  static const Color inputBorderColor = Color(0xFFFAFBFB);
  static const Color inputHintColor = Color(0xFFB0B3B2);

  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: themeBgColor,
        foregroundColor: buttonText,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(inputBorderRadius),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: inputHintColor, fontWeight: FontWeight.normal),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputBorderRadius),
        borderSide: BorderSide(color: inputBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputBorderRadius),
        borderSide: BorderSide(color: themeBgColor)

      ),
      filled: true,
      fillColor: inputBgColor,
    ),
  );
}
