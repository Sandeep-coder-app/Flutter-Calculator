import 'package:flutter/material.dart';


const Color blueclr = Color(0xFF4e5ae8);
const Color yellowclr = Color(0xFFFFB746);
const Color pinkclr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryclr = blueclr;
const Color darkGreyclr = Color(0xFF121212);
Color darkHeaderclr = Color(0xFF424242);


class Themes {

  static final light = ThemeData(
    primaryColor: Colors.blue,
    brightness:  Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyclr,
    brightness: Brightness.dark,
  );
}