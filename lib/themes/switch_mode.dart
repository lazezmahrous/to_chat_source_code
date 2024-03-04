// ignore_for_file: file_names, unused_element
import 'package:flutter/material.dart';
import 'package:to_chat/constanc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: HexColor('#00b5e9'),
    brightness: Brightness.light,
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.light(
      primary: HexColor('#00b5e9'),
    ),
    // primaryColorLight: ,
    iconTheme: IconThemeData(
      color: Constans.kColorCyan,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Constans.kColorCyan),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: HexColor('#00b5e9'),
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.cairo().fontFamily,
    colorScheme: ColorScheme.dark(
      primary: HexColor('#00b5e9'),
    ),
    iconTheme: IconThemeData(
      color: Constans.kColorCyan,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Constans.kColorCyan),
      ),
    ),
  );

  static ThemeMode _currentThemeMode = ThemeMode.light; // تعريف المتغير هنا

  static ThemeMode get currentThemeMode => _currentThemeMode;

  static Future<void> toggleThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentThemeMode =
        _currentThemeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    await prefs.setInt('theme_mode', _currentThemeMode.index);
  }

  static Future<ThemeMode> getSavedThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return ThemeMode.values[prefs.getInt('theme_mode') ?? 0];
  }
}

ThemeClass _themeClass = ThemeClass();
