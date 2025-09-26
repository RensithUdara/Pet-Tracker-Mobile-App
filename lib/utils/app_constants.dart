import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF9FBE9F); // Sage green from the design
  static const Color secondary = Color(0xFFE8F3E8); // Light green
  static const Color accent = Color(0xFF7B9B7B); // Darker green
  static const Color background = Color(0xFFF8F8F8); // Light background
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFE57373);
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Color(0xFF2E2E2E);
  static const Color onSurface = Color(0xFF2E2E2E);
  static const Color onBackground = Color(0xFF2E2E2E);
  static const Color textPrimary = Color(0xFF2E2E2E);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
}

class AppDimensions {
  static const double borderRadius = 12.0;
  static const double borderRadiusLarge = 20.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  static const double buttonHeight = 56.0;
  static const double iconSize = 24.0;
  static const double iconSizeLarge = 80.0;
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.onPrimary,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textHint,
  );
}