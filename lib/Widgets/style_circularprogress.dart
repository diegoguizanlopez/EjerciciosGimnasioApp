import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Estilo de CircularProgres predeterminado
class StyleCircularprogress extends StatelessWidget {
  String text;
  StyleCircularprogress({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.all(20),
            height: 150,
            width: 150,
            child: CircularProgressIndicator(color: Colors.black,)),
        Text("Working...",style:GoogleFonts.poppins(fontSize: 26),)
      ],
    );
  }
}