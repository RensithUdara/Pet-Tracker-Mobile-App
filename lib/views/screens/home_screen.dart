import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/app_constants.dart';
import '../widgets/custom_button.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('PetCare Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              _showSignOutDialog(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer<AuthController>(
        builder: (context, authController, child) {
          final user = authController.currentUser;
          
          return Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome message
                Text(
                  'Welcome back!',
                  style: AppTextStyles.heading2,
                ),
                
                if (user != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    user.email,
                    style: AppTextStyles.subtitle1,
                  ),
                ],
                
                const SizedBox(height: AppDimensions.paddingXLarge),
                
                // Dashboard cards
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppDimensions.paddingMedium,
                    mainAxisSpacing: AppDimensions.paddingMedium,
                    children: [
                      _buildDashboardCard(
                        icon: Icons.pets,
                        title: 'My Pets',
                        subtitle: 'Manage your furry friends',
                        color: AppColors.primary,
                      ),
                      _buildDashboardCard(
                        icon: Icons.schedule,
                        title: 'Schedule',
                        subtitle: 'Feeding & walking times',
                        color: AppColors.accent,
                      ),
                      _buildDashboardCard(
                        icon: Icons.favorite,
                        title: 'Health Records',
                        subtitle: 'Vaccinations & checkups',
                        color: Colors.red.shade400,
                      ),
                      _buildDashboardCard(
                        icon: Icons.notifications,
                        title: 'Reminders',
                        subtitle: 'Never miss appointments',
                        color: Colors.orange.shade400,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppDimensions.paddingLarge),
                
                // Quick actions
                Text(
                  'Quick Actions',
                  style: AppTextStyles.heading2,
                ),
                
                const SizedBox(height: AppDimensions.paddingMedium),
                
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Add Pet',
                        onPressed: () {
                          // TODO: Navigate to add pet screen
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Add Pet feature coming soon!'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: AppDimensions.paddingMedium),
                    Expanded(
                      child: CustomButton(
                        text: 'Quick Log',
                        onPressed: () {
                          // TODO: Navigate to quick log screen
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Quick Log feature coming soon!'),
                            ),
                          );
                        },
                        isOutlined: true,
                        icon: Icon(Icons.edit, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingMedium),
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
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthController>().signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}