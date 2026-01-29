import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/constants.dart';
import 'sections/intro_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muhammad Hashim - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          background: AppColors.background,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.name, style: AppTextStyles.navLink.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          // On Desktop we might want nav links here, for now keeping it simple
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            IntroSection(),
            AboutSection(),
            SkillsSection(),
            ProjectsSection(),
            ContactSection(),
            SizedBox(height: 50), // Bottom padding
          ],
        ),
      ),
    );
  }
}
