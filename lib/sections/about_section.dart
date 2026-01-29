import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/constants.dart';
import '../widgets/section_title.dart';
import '../widgets/reveal_on_scroll.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: AppColors.background,
      width: double.infinity,
      child: Column(
        children: [
          const SectionTitle(title: "About Me"),
          const SizedBox(height: 20),
          RevealOnScroll(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Card(
                elevation: 2,
                color: AppColors.surface, // Ensure card color matches theme
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    AppStrings.aboutMe,
                    style: AppTextStyles.body.copyWith(height: 1.6, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
