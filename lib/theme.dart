import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0C54BE);

const Color secondaryColor = Color(0xFF000000);
const Color backgroundColor = Color(0xFFF5F9FD);


ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: secondaryColor),
    bodyMedium: TextStyle(color: secondaryColor),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(primaryColor),
      foregroundColor: WidgetStateProperty.all(backgroundColor),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(primaryColor),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(primaryColor),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),

  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),

  iconTheme: const IconThemeData(
    color: secondaryColor,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: primaryColor,
    selectedItemColor: backgroundColor,
    unselectedItemColor: backgroundColor,
  ),

  tabBarTheme: const TabBarTheme(
    labelColor: secondaryColor,
    unselectedLabelColor: primaryColor,
  ),

  snackBarTheme: const SnackBarThemeData(
    backgroundColor: primaryColor,
    contentTextStyle: TextStyle(color: backgroundColor),
  ),

  dialogTheme: const DialogTheme(
    backgroundColor: backgroundColor,
    titleTextStyle: TextStyle(color: secondaryColor),
    contentTextStyle: TextStyle(color: secondaryColor),
  ),

  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primaryColor,
    selectionColor: primaryColor,
    selectionHandleColor: primaryColor,
  ),


);
