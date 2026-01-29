import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF2962FF); // Bright Blue Accent
  static const Color primaryVariant = Color(0xFF0039CB);
  static const Color secondary = Color(0xFF00E5FF); // Cyan Accent
  static const Color secondaryVariant = Color(0xFF00B8D4);
  
  static const Color background = Color(0xFF000000); // Pure Black
  static const Color surface = Color(0xFF10141D); // Very Dark Blue for Cards
  
  static const Color error = Color(0xFFCF6679);
  
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.black;
  static const Color onBackground = Colors.white; // White text on black
  static const Color onSurface = Colors.white; // White text on cards
  static const Color onError = Colors.black;
}

class AppTextStyles {
  static TextStyle get header => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.onBackground,
      );
  
  static TextStyle get subHeader => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.onBackground,
      );

  static TextStyle get body => GoogleFonts.roboto(
        fontSize: 16,
        color: AppColors.onBackground.withOpacity(0.8),
      );
      
  static TextStyle get navLink => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
}

class AppStrings {
  static const String name = "Muhammad Hashim";
  static const String role = "Flutter Developer (Fresher)";
  static const String location = "India";
  static const String availability = "Open to Remote / Onsite";
  
  static const String aboutMe = 
      "Flutter Developer with hands-on experience in building cross-platform mobile apps using Flutter and Dart.\n"
      "Strong understanding of state management, local databases, and REST API integration.\n"
      "Currently learning Firebase and AI integration.";

  // Social Links
  static const String email = "mailto:hashimtech336@gmail.com";
  static const String whatsapp = "https://wa.me/919895475336";
  static const String github = "https://github.com/hashimtkd";
  static const String linkedin = "https://www.linkedin.com/in/muhammad-hashim-590b4b377";
}
