import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_sgsst/src/presentation/theme/app_colors.dart';
import 'package:software_sgsst/src/presentation/theme/app_fonts.dart';


TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color? color, // can be null
    [TextStyle? textStyle]
    ) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    textStyle: textStyle,
  );
}

extension LabelStyle on TextStyle {
  // Big style
  static TextStyle big({
    double fontSize = FontSize.s50,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.black,
      color ?? AppColors.primary,
    );
  }

  // Heading style
  static TextStyle heading({
    double fontSize = FontSize.s30,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.black,
      color,
    );
  }

  // Title style
  static TextStyle title({
    double fontSize = FontSize.s18,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.black,
      color,
    );
  }

  // Medium style
  static TextStyle subtitle({
    double fontSize = FontSize.s16,
    Color? color = AppColors.grey,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.bold,
      color,
    );
  }

  // Paragraph style
  static TextStyle paragraph({
    double fontSize = FontSize.s14,
    Color? color = AppColors.grey,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.medium,
      color,
    );
  }

  // Caption style
  static TextStyle caption({
    double fontSize = FontSize.s12,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.light,
      color,
    );
  }

  // Caption style
  static TextStyle solidButton({
    double fontSize = FontSize.s14,
    Color? color = Colors.white,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.bold,
      color,
    );
  }

  // Caption style
  static TextStyle outlinedButton({
    double fontSize = FontSize.s14,
    Color? color = Colors.black,
  }) {
    return _getTextStyle(
      fontSize,
      CustomFontWeight.bold,
      color,
    );
  }

  // Caption style
  static TextStyle linkButton({
    double fontSize = FontSize.s14,
    Color? color = Colors.black,
  }) {
    return _getTextStyle(
        fontSize,
        CustomFontWeight.bold,
        color,
        const TextStyle(decoration: TextDecoration.underline)
    );
  }
}
