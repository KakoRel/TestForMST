import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color backgroundDark = Color(0xFF050814);
  static const Color backgroundCard = Color(0xFF111526);
  static const Color accentPurple = Color(0xFF9C6BFF);
  static const Color accentBlue = Color(0xFF4AD0FF);
  static const Color accentPink = Color(0xFFFF7AC3);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB6B8D6);
  static const Color lockedOverlay = Colors.black54;
}

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.accentPurple,
        secondary: AppColors.accentBlue,
        surface: AppColors.backgroundCard,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        base.textTheme,
      ).apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.backgroundCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: const Color(0xFF181C2F),
        selectedColor: AppColors.accentPurple,
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
        secondaryLabelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}

