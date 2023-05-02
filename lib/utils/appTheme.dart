import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final global =
      ThemeData(textTheme: _textTheme(), appBarTheme: _appBarTheme());

  static TextTheme _textTheme() {
    return TextTheme(
        headline1: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w700));
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: Colors.white,
        // color: AppColors.primary,
        iconTheme: IconThemeData(color: Colors.black));
  }
}

class AppColors {
  static const appGreen = Color(0xFF1ED760);
  static const appGrey = Color(0xFF535353);
  static const textFieldGrey = Color(0xFF777777);
  static const whiteButton = Color(0xFFF5F5F5);
}
