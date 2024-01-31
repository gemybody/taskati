import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/utils/app_colors.dart';

TextStyle getTitleStyle({
  double fontsize = 18,
  FontWeight fontWeight = FontWeight.bold,
  Color color = const Color(0xff4E5AE8)
}) {
  return TextStyle(
    fontSize: fontsize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}

TextStyle getBodyStyle({
  double fontsize = 16,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontSize: fontsize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}

TextStyle getSmallStyle({
  double fontsize = 14,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.grey,
}) {
  return TextStyle(
    fontSize: fontsize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
