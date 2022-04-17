import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_sgsst/src/presentation/theme/app_colors.dart';
import 'package:software_sgsst/src/presentation/theme/label_styles.dart';

abstract class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        titleTextStyle: LabelStyle.title(
          color: AppColors.black,
        ),
        foregroundColor: AppColors.black,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          hintStyle: GoogleFonts.poppins(fontSize: 12.0),
          labelStyle: GoogleFonts.poppins(color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.accent, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
          suffixIconColor: AppColors.accent),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.accent,
        selectionColor: AppColors.accent.withOpacity(0.4),
        selectionHandleColor: AppColors.accent,
      ),
    );
  }
}
