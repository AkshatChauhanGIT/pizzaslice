import 'package:flutter/material.dart';
import 'package:pizzaslice/core/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60), // Top spacing

              // Profile Avatar
              _buildProfileAvatar(),

              const SizedBox(height: 16),

              // Title Section
              _buildTitleSection(),

              const SizedBox(height: 32),

              // Email Field
              _buildInputField(
                label: "Email",
                hintText: "Enter your email",
              ),

              const SizedBox(height: 16),

              // Password Field
              _buildInputField(
                label: "Password",
                hintText: "Enter your password",
                isPassword: true,
              ),

              const SizedBox(height: 24),

              // Login Button
              _buildLoginButton(),

              const SizedBox(height: 24),

              // Social Login Icons
              _buildSocialLoginIcons(),

              const SizedBox(height: 24),

              // Footer Text
              _buildFooterText(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Avatar Widget
  Widget _buildProfileAvatar() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: AppTheme.themeBgColor,
      child: const Text(
        "U",
        style: TextStyle(
          fontSize: 40,
          color: AppTheme.themeBgColorLight,
        ),
      ),
    );
  }

  // Title Section Widget
  Widget _buildTitleSection() {
    return const Column(
      children: [
        Text(
          "Irresistable Experience",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          "on your way loading.....",
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Input Field Widget
  Widget _buildInputField({
    required String label,
    required String hintText,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: isPassword
                ? const Icon(Icons.visibility_off, color: Colors.grey)
                : null,
          ),
        ),
      ],
    );
  }

  // Login Button Widget
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.themeBgColor,
          foregroundColor: Colors.white,
        ),
        child: const Text("Login", style: TextStyle(fontSize: 16)),
      ),
    );
  }

  // Social Login Icons Widget
  Widget _buildSocialLoginIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image.asset('assets/apple_logo.png', width: 20),
        ),
        const SizedBox(width: 12),
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppTheme.themeBgColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image.asset(
            'assets/images/google-logo-sm.png',
            width: 20,
          ),
        ),
      ],
    );
  }

  // Footer Text Widget
  Widget _buildFooterText() {
    return const Text(
      "Lorem ipsum is a dummy text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.",
      style: TextStyle(fontSize: 12, color: Colors.grey),
      textAlign: TextAlign.center,
    );
  }
}