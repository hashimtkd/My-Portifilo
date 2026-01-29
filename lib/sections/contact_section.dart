import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';
import '../widgets/section_title.dart';
import '../widgets/reveal_on_scroll.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String message = _messageController.text;

      final String body = "Name: $name\nEmail: $email\n\nMessage:\n$message";
      
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'hashimtech336@gmail.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Portfolio Contact',
          'body': body,
        }),
      );

      // Launch mode externalApplication is important for mailto to work reliably
      if (!await launchUrl(emailUri)) {
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch email client')),
          );
        }
      }
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.background,
      width: double.infinity,
      child: Column(
        children: [
          const SectionTitle(title: "Get In Touch"),
          const SizedBox(height: 40),
          RevealOnScroll(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: _buildContactInfo()),
                      const SizedBox(width: 50),
                      Expanded(child: _buildContactForm()),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildContactInfo(),
                      const SizedBox(height: 50),
                      _buildContactForm(),
                    ],
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 60),
           Text(
            "© ${DateTime.now().year} by ${AppStrings.name}",
            style: AppTextStyles.body.copyWith(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Talk",
          style: AppTextStyles.header.copyWith(
            color: AppColors.primary,
            fontSize: 36,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "I'm open to discussing web development projects or partnership opportunities. Feel free to reach out!",
          style: AppTextStyles.body.copyWith(color: Colors.white70, height: 1.6),
        ),
        const SizedBox(height: 30),
        _buildInfoItem(Icons.email, "hashimtech336@gmail.com"),
        const SizedBox(height: 15),
        _buildInfoItem(Icons.location_on, "Kerala, India"),
        const SizedBox(height: 30),
        Row(
          children: [
             _buildSocialIcon(FontAwesomeIcons.github, AppStrings.github),
             const SizedBox(width: 20),
             _buildSocialIcon(FontAwesomeIcons.linkedin, AppStrings.linkedin),
             const SizedBox(width: 20),
             _buildSocialIcon(FontAwesomeIcons.whatsapp, AppStrings.whatsapp),
          ],
        )
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.secondary, size: 24),
        const SizedBox(width: 15),
        Text(
          text,
          style: AppTextStyles.body.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon, color: Colors.white70),
      hoverColor: AppColors.primary,
      iconSize: 24,
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: _nameController, 
              label: "Name", 
              icon: Icons.person_outline
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _emailController, 
              label: "Email", 
              icon: Icons.email_outlined,
              isEmail: true
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _messageController, 
              label: "Message", 
              icon: Icons.message_outlined, 
              maxLines: 4
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _sendEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: Text(
                "Send Message",
                style: AppTextStyles.body.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        if (isEmail && !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
