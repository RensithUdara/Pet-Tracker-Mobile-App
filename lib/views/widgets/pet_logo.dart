import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class PetLogo extends StatelessWidget {
  final double size;
  final bool showTitle;

  const PetLogo({
    super.key,
    this.size = 120,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Dog emoji
              Positioned(
                left: size * 0.15,
                child: Text(
                  '🐕',
                  style: TextStyle(
                    fontSize: size * 0.3,
                  ),
                ),
              ),
              // Cat emoji
              Positioned(
                right: size * 0.15,
                child: Text(
                  '🐱',
                  style: TextStyle(
                    fontSize: size * 0.3,
                  ),
                ),
              ),
              // Heart emoji
              Positioned(
                bottom: size * 0.25,
                child: Text(
                  '❤️',
                  style: TextStyle(
                    fontSize: size * 0.15,
                  ),
                ),
              ),
              // Paw prints
              Positioned(
                top: size * 0.15,
                left: size * 0.3,
                child: Icon(
                  Icons.pets,
                  size: size * 0.12,
                  color: AppColors.primary,
                ),
              ),
              Positioned(
                top: size * 0.25,
                right: size * 0.25,
                child: Icon(
                  Icons.pets,
                  size: size * 0.1,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
        ),
        if (showTitle) ...[
          const SizedBox(height: AppDimensions.paddingMedium),
          const Text(
            'PetCare',
            style: AppTextStyles.heading1,
          ),
          const SizedBox(height: 8),
          const Text(
            'Loving care for your furry friends',
            style: AppTextStyles.subtitle1,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
