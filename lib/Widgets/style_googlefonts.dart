import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

///Widget de Texto con estilo predeterminado
class StyleGoogleFonts extends StatelessWidget {
  final String body;
  double size;
  bool white;
  FontWeight? weight;
  TextDecoration? decoration;
  StyleGoogleFonts(
      {Key? key,
      required this.body,
      this.weight,
      this.size = 16,
      this.white = false,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      style: GoogleFonts.poppins(
          color: white ? Colors.white : Colors.black,
          decoration: decoration,
          decorationColor: white ? Colors.white : Colors.black,
          fontSize: size,
          fontWeight: weight),
      body,
      textAlign: TextAlign.center,
    );
  }
}
