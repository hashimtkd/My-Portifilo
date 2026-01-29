import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.background,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 3),
                image: const DecorationImage(
                  image: AssetImage('assets/profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: Text(AppStrings.name, style: AppTextStyles.header.copyWith(fontSize: 40)),
          ),
          const SizedBox(height: 10),
          FadeInDown(
            delay: const Duration(milliseconds: 400),
            child: Text(AppStrings.role, style: AppTextStyles.subHeader.copyWith(color: AppColors.primary)),
          ),
          const SizedBox(height: 15),
          FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 5),
                Text(AppStrings.location, style: AppTextStyles.body),
                const SizedBox(width: 20),
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 5),
                Text(AppStrings.availability, style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
