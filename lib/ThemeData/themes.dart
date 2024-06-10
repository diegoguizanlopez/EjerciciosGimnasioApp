import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  textTheme: TextTheme(
    bodyMedium: Function.apply(google_style, [], {#size: double_parse(16)}),
    bodySmall: Function.apply(google_style, [], {#size: double_parse(8)}),
    bodyLarge: Function.apply(google_style, [], {#size: double_parse(24)}),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
    textTheme: ButtonTextTheme.accent,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    titleTextStyle: Function.apply(google_style, [], {#size: double_parse(24)}),
  ),
);

TextStyle google_style({double size = 8}) {
  return GoogleFonts.poppins(fontSize: size);
}

double? double_parse(int value) {
  return double.parse('$value');
}
