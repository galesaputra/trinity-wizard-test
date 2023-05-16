import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final dynamic title;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextOverflow overflow;
  final TextAlign? align;
  final bool money;
  final bool number;
  final bool isItalic;
  final bool isBold;
  final bool isHeadline;
  final TextDecoration? decoration;
  final int? maxLines;
  final double thickness;
  final Color color;
  final double lineHeight;

  TextWidget(this.title,
      {this.fontSize = 14,
      this.fontWeight,
      this.overflow = TextOverflow.ellipsis,
      this.money = false,
      this.number = false,
      this.decoration,
      this.maxLines,
      this.align,
      this.isBold = false,
      this.isItalic = false,
      this.isHeadline = false,
      this.color = Colors.black,
      this.lineHeight = 1,
      this.thickness = 4});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: GoogleFonts.inter(
          color: color,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.w600 : fontWeight,
          decoration: decoration,
          decorationThickness: thickness,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal),
      overflow: overflow,
      textAlign: align,
      maxLines: maxLines,
    );
  }
}
