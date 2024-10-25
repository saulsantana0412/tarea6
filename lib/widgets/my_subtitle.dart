import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea6/common/color_palette.dart';

class MySubtitle extends StatelessWidget {
  final String text;
  final Color color;
  
  const MySubtitle( {super.key, required this.text, this.color = ColorPalette.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: GoogleFonts.workSans(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color
      )
    );
  }
}

class MySubtitle2 extends StatelessWidget {
  final String text;
  final Color color;
  
  const MySubtitle2( {super.key, required this.text, this.color = ColorPalette.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: GoogleFonts.workSans(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: color
      )
    );
  }
}