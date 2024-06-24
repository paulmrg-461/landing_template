import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static bool isDarkMode = true;
  static const Color primaryColor = Colors.amber;
  // static const Color primaryColor = Color(0xffA82C36);
  static const Color secondaryColor = Color(0xffA82C36);
  // static const Color secondaryColor = Color(0xffB59819);
  // static const Color backgroundColor = Color(0xff171A1A);
  static const Color backgroundColor = Color(0xff1f1e1a);
  static final TextStyle defaultFontStyle = GoogleFonts.manrope();

  static final TextTheme textTheme = TextTheme(
    headlineLarge: defaultFontStyle,
    headlineMedium: defaultFontStyle,
    headlineSmall: defaultFontStyle,
    bodyLarge: defaultFontStyle,
    bodyMedium: defaultFontStyle,
    bodySmall: defaultFontStyle,
    displayLarge: defaultFontStyle,
    displayMedium: defaultFontStyle,
    displaySmall: defaultFontStyle,
    titleLarge: defaultFontStyle,
    titleMedium: defaultFontStyle,
    titleSmall: defaultFontStyle,
    labelLarge: defaultFontStyle,
    labelMedium: defaultFontStyle,
    labelSmall: defaultFontStyle,
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: textTheme,
    colorScheme: ColorScheme.fromSeed(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      seedColor: primaryColor,
      // dynamicSchemeVariant: DynamicSchemeVariant.fidelity
    ),
  );
}
