import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.header,
          ),
          const SizedBox(height: 5),
          Container(
            height: 4,
            width: 60,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
