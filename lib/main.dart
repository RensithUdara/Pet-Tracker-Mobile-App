import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'utils/app_constants.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
      ],
      child: MaterialApp(
        title: 'PetCare - Pet Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: MaterialColor(
            AppColors.primary.value,
            <int, Color>{
              50: AppColors.primary.withOpacity(0.1),
              100: AppColors.primary.withOpacity(0.2),
              200: AppColors.primary.withOpacity(0.3),
              300: AppColors.primary.withOpacity(0.4),
              400: AppColors.primary.withOpacity(0.5),
              500: AppColors.primary.withOpacity(0.6),
              600: AppColors.primary.withOpacity(0.7),
              700: AppColors.primary.withOpacity(0.8),
              800: AppColors.primary.withOpacity(0.9),
              900: AppColors.primary,
            },
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            surface: AppColors.surface,
            background: AppColors.background,
            error: AppColors.error,
            onPrimary: AppColors.onPrimary,
            onSecondary: AppColors.onSecondary,
            onSurface: AppColors.onSurface,
            onBackground: AppColors.onBackground,
          ),
          useMaterial3: true,
          fontFamily: 'System',
          textTheme: const TextTheme(
            headlineLarge: AppTextStyles.heading1,
            headlineMedium: AppTextStyles.heading2,
            titleMedium: AppTextStyles.subtitle1,
            bodyLarge: AppTextStyles.body1,
            bodyMedium: AppTextStyles.body2,
            labelLarge: AppTextStyles.button,
            bodySmall: AppTextStyles.caption,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
            elevation: 0,
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
              ),
              elevation: 0,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
              borderSide: const BorderSide(color: AppColors.textHint),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
              borderSide: const BorderSide(color: AppColors.textHint),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
        home: Consumer<AuthController>(
          builder: (context, authController, child) {
            if (authController.isAuthenticated) {
              // If user is authenticated, navigate to home
              return const LoginScreen(); // This will be replaced with navigation logic
            } else if (authController.hasCompletedOnboarding()) {
              // If onboarding is complete, show login
              return const LoginScreen();
            } else {
              // Show welcome screen for first time users
              return const WelcomeScreen();
            }
          },
        ),
      ),
    );
  }
}
