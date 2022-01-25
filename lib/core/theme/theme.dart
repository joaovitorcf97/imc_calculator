import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor pink = MaterialColor(
    _pinkPrimary,
    <int, Color>{
      50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEC407A),
      500: Color(_pinkPrimary),
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    },
  );

  static const int _pinkPrimary = 0xFFC1007E;

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF767676);
  static const Color black = Color(0xFF020002);

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: white,
    primaryColor: pink,
    colorScheme: ThemeData().colorScheme.copyWith(primary: pink),
    appBarTheme: const AppBarTheme(
      color: pink,
      elevation: 0,
    ),
    fontFamily: 'Poppins',
  );
}
