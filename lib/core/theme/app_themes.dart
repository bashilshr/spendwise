import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      surface: AppColors.lightBackground,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      surface: AppColors.darkBackground,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
    ),
  );
}
