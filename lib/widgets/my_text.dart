import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea6/common/color_palette.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;

  const MyText({super.key, required this.text, this.color = ColorPalette.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: GoogleFonts.workSans(
        fontSize: 15,
        color: color
      )
    );
  }
}
