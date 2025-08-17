import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const defaultColor = Colors.indigo;
  static const String defaultHeader = "Ortalama Hesapla";
  static BorderRadius borderRadius = BorderRadius.circular(12);
  static final TextStyle headerTextStyle = GoogleFonts.quicksand(
    fontSize: 24,
    color: defaultColor,
    fontWeight:  FontWeight.w900,
  );
  static final TextStyle ortalamaBodyStyle = GoogleFonts.quicksand(
    fontSize: 17,
    color: defaultColor,
    fontWeight:  FontWeight.w600,
  );
  static final TextStyle ortStyle = GoogleFonts.quicksand(
    fontSize: 55,
    color: defaultColor,
    fontWeight:  FontWeight.w800,
  );
  static final dropdownPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final yatayPadding = const EdgeInsets.symmetric(horizontal: 8.0);



}