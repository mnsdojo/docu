import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red[400],
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.red[400],
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red[400],
    textTheme: ButtonTextTheme.primary,
  ),
  cardColor: Colors.white,
  dividerColor: Colors.grey[300],
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red[400],
    foregroundColor: Colors.white,
    elevation: 6,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red[300]),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.red[600],
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.red[600],
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red[600],
    textTheme: ButtonTextTheme.primary,
  ),
  cardColor: Colors.grey[850],
  dividerColor: Colors.grey[700],
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red[600],
    foregroundColor: Colors.white,
    elevation: 6,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red[400]),
);
