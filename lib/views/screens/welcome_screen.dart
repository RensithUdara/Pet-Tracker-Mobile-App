import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/app_constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/pet_logo.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingLarge),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo and title
              const PetLogo(size: 140),

              const SizedBox(height: AppDimensions.paddingXLarge),

              // Feature icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureIcon(Icons.pets, AppColors.primary),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  _buildFeatureIcon(Icons.pets, AppColors.primary),
                ],
              ),

              const SizedBox(height: 20),

              // Small paw prints
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pets,
                    size: 20,
                    color: AppColors.primary.withOpacity(0.6),
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    Icons.pets,
                    size: 16,
                    color: AppColors.primary.withOpacity(0.4),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // App name and subtitle
              Text(
                'PetCare',
                style: AppTextStyles.heading1.copyWith(
                  fontSize: 36,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Simple pet management for busy pet parents',
                style: AppTextStyles.subtitle1,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppDimensions.paddingXLarge),

              // Feature cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureCard(
                    icon: Icons.schedule,
                    title: 'Schedule',
                    subtitle: 'Track feeding &\nwalks',
                  ),
                  _buildFeatureCard(
                    icon: Icons.favorite,
                    title: 'Health',
                    subtitle: 'Monitor\nwellness',
                  ),
                  _buildFeatureCard(
                    icon: Icons.calendar_today,
                    title: 'Reminders',
                    subtitle: 'Never miss\nappointments',
                  ),
                ],
              ),

              const SizedBox(height: AppDimensions.paddingXLarge),

              // Description
              const Text(
                'Keep your furry friends healthy and happy with\nsimple tracking tools and smart reminders.',
                style: AppTextStyles.body2,
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 2),

              // Get Started button
              CustomButton(
                text: 'Get Started',
                onPressed: () {
                  context.read<AuthController>().completeOnboarding();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
              ),

              const SizedBox(height: AppDimensions.paddingMedium),

              // Skip for now
              TextButton(
                onPressed: () {
                  context.read<AuthController>().completeOnboarding();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Skip for now',
                  style: AppTextStyles.body2,
                ),
              ),

              const SizedBox(height: AppDimensions.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyles.body1.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: AppTextStyles.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
