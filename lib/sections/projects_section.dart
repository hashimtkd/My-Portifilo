import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/constants.dart';
import '../widgets/section_title.dart';
import '../widgets/hover_effect.dart';
import '../widgets/reveal_on_scroll.dart';

class ProjectModel {
  final String title;
  final String description;
  final String link;

  ProjectModel({required this.title, required this.description, required this.link});
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProjectModel> projects = [
      ProjectModel(
        title: "EduTrak System – Teachers App",
        description: "A comprehensive system for teachers to track education metrics.",
        link: "https://github.com/hashimtkd/EduTrack",
      ),
      ProjectModel(
        title: "Weather App",
        description: "A simple weather application to check real-time forecasts.",
        link: "https://github.com/hashimtkd/appweather",
      ),
      ProjectModel(
        title: "Todo App",
        description: "Manage your daily tasks efficiently with this Todo app.",
        link: "https://github.com/hashimtkd/TODO-app",
      ),
      ProjectModel(
        title: "Money Manager App",
        description: "Track your income and expenses to manage finances better.",
        link: "https://github.com/hashimtkd/money-manager",
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: AppColors.background,
      width: double.infinity,
      child: Column(
        children: [
          const SectionTitle(title: "Projects"),
          const SizedBox(height: 20),
          RevealOnScroll(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: projects.map((project) => _buildProjectCard(context, project)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectModel project) {
    return HoverEffect(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Darker shadow
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.title, style: AppTextStyles.subHeader.copyWith(fontSize: 18, color: Colors.white)),
          const SizedBox(height: 10),
          Text(
            project.description,
            style: AppTextStyles.body.copyWith(fontSize: 14, color: Colors.white70),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _launchURL(project.link),
            icon: const Icon(Icons.code),
            label: const Text("View Code"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
