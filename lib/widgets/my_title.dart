import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea6/common/color_palette.dart';

class MyTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  
  const MyTitle({super.key, required this.text, this.color = ColorPalette.white, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: GoogleFonts.workSans(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color
      )
    );
  }
}

class MyTitle2 extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  
  const MyTitle2({super.key, required this.text, this.color = ColorPalette.white, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: GoogleFonts.workSans(
        fontSize:size,
        fontWeight: FontWeight.w600,
        color: color
      )
    );
  }
}