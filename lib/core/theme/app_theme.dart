import 'package:flutter/material.dart';

class AppGrayscale {
  static const titleActive = Color(0xFF222222);
  static const body = Color(0xFF333333);
  static const label = Color(0xFF555555);
  static const placeholder = Color(0xFF888888);

  static const line = Color(0xFFDCDCDC);
  static const inputBackground = Color(0xFFF0F0F0);
  static const background = Color(0xFFF8F8F8);
  static const offWhite = Color(0xFFFCFCFC);
}

class AppColors {
  static const primary = Color(0xFF002EF1);
  static const primaryDark = Color(0xFF0000EA);
  static const primaryDarkMode = Color(0xFF005CFF);

  static const secondary = Color(0xFFFFB802);
  static const secondaryDark = Color(0xFFFF9700);
  static const secondaryDarkMode = Color(0xFFFFE604);

  static const error = Color(0xFFFE3F61);
  static const errorDark = Color(0xFFFD0025);
  static const errorDarkMode = Color(0xFFFF7E86);

  static const success = Color(0xFF009846);
  static const successDark = Color(0xFF02971C);
  static const successDarkMode = Color(0xFF36EA88);

  static const warning = Color(0xFFFF6711);
  static const warningDark = Color(0xFFEB3800);
  static const warningDarkMode = Color(0xFFFF9922);
}

class AppGradients {
  static const primary = LinearGradient(colors: [Color(0xFF0000EB), Color(0xFF004BFB)]);

  static const secondary = LinearGradient(colors: [Color(0xFFFF9C00), Color(0xFFFFDB03)]);

  static const accent = LinearGradient(
    colors: [Color(0xFF0038F5), Color(0xFF9F03FF)],
    begin: AlignmentGeometry.topLeft,
  );
}

class AppTextTheme {
  static const TextTheme textThemeLight = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 40,
      color: AppGrayscale.titleActive,
      fontVariations: [FontVariation("wght", 700)],
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      color: AppGrayscale.titleActive,
      fontVariations: [FontVariation("wght", 700)],
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      color: AppGrayscale.titleActive,
      fontVariations: [FontVariation("wght", 700)],
    ),
    displayLarge: TextStyle(
      fontSize: 40,
      color: AppGrayscale.titleActive,
      fontVariations: [FontVariation("wght", 400)],
    ),
    displayMedium: TextStyle(
      fontSize: 32,
      color: AppGrayscale.titleActive,
      fontVariations: [FontVariation("wght", 400)],
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      color: AppGrayscale.titleActive,
      fontVariations: [FontVariation("wght", 400)],
    ),
    bodyLarge: TextStyle(fontSize: 20, color: AppGrayscale.body, fontVariations: [FontVariation("wght", 400)]),
    bodyMedium: TextStyle(fontSize: 16, color: AppGrayscale.body, fontVariations: [FontVariation("wght", 400)]),
    bodySmall: TextStyle(fontSize: 14, color: AppGrayscale.body, fontVariations: [FontVariation("wght", 400)]),
    labelLarge: TextStyle(fontSize: 20, color: AppGrayscale.body, fontVariations: [FontVariation("wght", 700)]),
    labelMedium: TextStyle(fontSize: 16, color: AppGrayscale.body, fontVariations: [FontVariation("wght", 700)]),
    labelSmall: TextStyle(fontSize: 14, color: AppGrayscale.body, fontVariations: [FontVariation("wght", 700)]),
  );
  static const TextTheme textThemeDark = TextTheme(
    headlineLarge: TextStyle(fontSize: 40, color: AppGrayscale.offWhite, fontVariations: [FontVariation("wght", 700)]),
    headlineMedium: TextStyle(fontSize: 32, color: AppGrayscale.offWhite, fontVariations: [FontVariation("wght", 700)]),
    headlineSmall: TextStyle(fontSize: 24, color: AppGrayscale.offWhite, fontVariations: [FontVariation("wght", 700)]),
    displayLarge: TextStyle(fontSize: 40, color: AppGrayscale.offWhite, fontVariations: [FontVariation("wght", 400)]),
    displayMedium: TextStyle(fontSize: 32, color: AppGrayscale.offWhite, fontVariations: [FontVariation("wght", 400)]),
    displaySmall: TextStyle(fontSize: 24, color: AppGrayscale.offWhite, fontVariations: [FontVariation("wght", 400)]),
    bodyLarge: TextStyle(fontSize: 20, color: AppGrayscale.background, fontVariations: [FontVariation("wght", 400)]),
    bodyMedium: TextStyle(fontSize: 16, color: AppGrayscale.background, fontVariations: [FontVariation("wght", 400)]),
    bodySmall: TextStyle(fontSize: 14, color: AppGrayscale.background, fontVariations: [FontVariation("wght", 400)]),
    labelLarge: TextStyle(fontSize: 20, color: AppGrayscale.background, fontVariations: [FontVariation("wght", 700)]),
    labelMedium: TextStyle(fontSize: 16, color: AppGrayscale.background, fontVariations: [FontVariation("wght", 700)]),
    labelSmall: TextStyle(fontSize: 14, color: AppGrayscale.background, fontVariations: [FontVariation("wght", 700)]),
  );
}

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: "Epilogue",
    textTheme: AppTextTheme.textThemeLight,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppGrayscale.background,
    dividerColor: AppGrayscale.line,
    dividerTheme: DividerThemeData(color: AppGrayscale.line, thickness: 1, indent: 24, endIndent: 24),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: Colors.white,
      surface: AppGrayscale.inputBackground,
      error: AppColors.error,
      onTertiary: AppGrayscale.label,
      onPrimary: AppGrayscale.titleActive,
      onSecondary: Colors.black,
      onSurface: AppGrayscale.titleActive,
      onError: Colors.white,
      surfaceContainer: AppGrayscale.titleActive,
      surfaceBright: AppGrayscale.offWhite,
      outline: AppGrayscale.line,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppGrayscale.inputBackground,
      border: OutlineInputBorder(borderSide: BorderSide(color: AppGrayscale.line)),
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(AppGrayscale.inputBackground),
      overlayColor: WidgetStatePropertyAll(AppGrayscale.inputBackground),
      shape: WidgetStatePropertyAll(RoundedSuperellipseBorder(borderRadius: BorderRadiusGeometry.circular(8))),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 13, color: AppGrayscale.placeholder, fontVariations: [FontVariation("wght", 500)]),
      ),
    ),
    cardColor: Colors.white,
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadiusGeometry.circular(32)),
      elevation: 0,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: "Epilogue",
    textTheme: AppTextTheme.textThemeDark,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppGrayscale.titleActive,
    dividerColor: AppGrayscale.line,
    dividerTheme: DividerThemeData(color: AppGrayscale.line, thickness: 1, indent: 24, endIndent: 24),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppGrayscale.body,
      surface: AppGrayscale.body,
      error: AppColors.error,
      onTertiary: AppGrayscale.offWhite,
      onPrimary: AppGrayscale.offWhite,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onError: Colors.white,
      surfaceContainer: AppGrayscale.body,
      surfaceBright: AppGrayscale.body,
      outline: AppGrayscale.background,
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(AppGrayscale.body),
      overlayColor: WidgetStatePropertyAll(AppGrayscale.body),
      shape: WidgetStatePropertyAll(RoundedSuperellipseBorder(borderRadius: BorderRadiusGeometry.circular(8))),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 13, color: AppGrayscale.offWhite, fontVariations: [FontVariation("wght", 500)]),
      ),
    ),
    cardColor: AppGrayscale.body,
    cardTheme: CardThemeData(
      color: AppGrayscale.body,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadiusGeometry.circular(32)),
      elevation: 0,
    ),
  );
}
