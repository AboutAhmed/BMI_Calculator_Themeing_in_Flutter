
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green[800],
  ),
  sliderTheme: SliderThemeData(
    inactiveTrackColor: Colors.grey,
    activeTrackColor: Colors.green[800],
    thumbColor: Colors.green[800],
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Color(0xFF91C694)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: Colors.green,
        width: 5,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.green,
      ),
      minimumSize: MaterialStateProperty.all<Size>(Size(280, 45),),
      maximumSize: MaterialStateProperty.all<Size>(
        Size(300, 50),
      ),
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
);

///TODO DARK THEME
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFEB1555),
  ),
  scaffoldBackgroundColor: Color(0xFF0A0E21),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 5,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: Colors.white,
        width: 5,
      ),
    ),
  ),
  sliderTheme: SliderThemeData(
    inactiveTrackColor: Colors.grey,
    activeTrackColor: Color(0xFFEB1555),
    thumbColor: Color(0xFFEB1555),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      minimumSize: MaterialStateProperty.all<Size>(Size(280, 45),),
      maximumSize: MaterialStateProperty.all<Size>(
        Size(300, 50),
      ),
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      color: Colors.white,
    ),
  ),
);