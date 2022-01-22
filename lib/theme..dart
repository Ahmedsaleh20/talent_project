import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const activeColor = Color(0xFF22A45D);
  static const stepperColor = Color(0xffEAC43E);
  static const accentColor = Color(0xFFEF9920);
  static const textDark = Color(0xFF010F07);
  static const bodyText = Color(0xFF868686);
  static const textLight = Color(0xFFF1F1F1);
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

TextTheme _textTheme = const TextTheme(
  bodyText1: TextStyle(
    fontSize: 16,
    color: AppColors.bodyText,
    letterSpacing: 1,
  ),
  bodyText2: TextStyle(
    fontSize: 16,
    color: AppColors.textDark,
    fontWeight: FontWeight.w800,
    letterSpacing: 1,
  ),
  // subtitle1: TextStyle(fontSize: 20 ),
  headline1: TextStyle(
      fontSize: 34, color: AppColors.textDark, fontWeight: FontWeight.w800),
  headline2: TextStyle(
      fontSize: 30, color: AppColors.textDark, fontWeight: FontWeight.bold),
  headline3: TextStyle(fontSize: 28),
  headline4: TextStyle(
    fontSize: 12,
  ),
  headline6: TextStyle(
    fontSize: 24,
  ),
  button: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    wordSpacing: 1,
  ),
);

class AppTheme {
  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  static const accentColor = AppColors.accentColor;
  static const visualDensity = VisualDensity;

  ThemeData get light => ThemeData(
    brightness: Brightness.light,
    cardColor: _LightColors.card,
    backgroundColor: _LightColors.background,
    scaffoldBackgroundColor: _LightColors.background,
    textTheme: GoogleFonts.sourceSansProTextTheme(_textTheme),
    iconTheme: const IconThemeData(color: AppColors.iconDark),
    colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: _textTheme.bodyText2),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.activeColor,
        fixedSize: const Size.fromHeight(40),
        // elevation: 1,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: _textTheme.button,
      ),
    ),
  );

  ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
    textTheme: GoogleFonts.sourceSansProTextTheme()
        .apply(bodyColor: AppColors.textLight),
    backgroundColor: _DarkColors.background,
    scaffoldBackgroundColor: _DarkColors.background,
    cardColor: _DarkColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppColors.textLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppColors.activeColor),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconLight),
  );
}

class CommonStyle {
  static InputDecoration textFieldStyle({
    required String hintTextStr,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hintTextStr,
        suffixIcon: suffixIcon);
  }
}
