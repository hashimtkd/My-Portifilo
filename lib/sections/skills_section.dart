import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/section_title.dart';
import '../widgets/reveal_on_scroll.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<String> skills = const [
    "Flutter", "Dart", 
    "Hive", "Sqflite", "REST API",
    "Provider", "GetX",
    "Git", "GitHub",
    "HTML", "CSS", "Bootstrap",
    "C", "Java (Basics)"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: AppColors.background, // Was white
      width: double.infinity,
      child: Column(
        children: [
          const SectionTitle(title: "Skills"),
          const SizedBox(height: 20),
          RevealOnScroll(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: skills.map((skill) => _buildSkillChip(skill)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      backgroundColor: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      label: Text(
        label,
        style: AppTextStyles.body.copyWith(
          color: AppColors.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
