import 'package:flutter/material.dart';
import 'package:pizzaslice/core/theme.dart';
import 'package:pizzaslice/presentation/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                _buildProfileAvatar(),
                const SizedBox(height: 16),
                _buildTitleSection(),
                const SizedBox(height: 32),
                _buildInputField(
                  label: "Name",
                  hintText: "Enter your name",
                  controller: _nameController,
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: "Email",
                  hintText: "Enter your email",
                  controller: _emailController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your email';
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: "Password",
                  hintText: "Enter your password",
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter your password' : null,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: "Confirm Password",
                  hintText: "Confirm your password",
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                _buildRegisterButton(context),
                const SizedBox(height: 24),
                _buildSocialLoginIcons(),
                const SizedBox(height: 24),
                _buildFooterText(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: AppTheme.themeBgColor,
      child: const Text(
        "U",
        style: TextStyle(fontSize: 40, color: AppTheme.themeBgColorLight),
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Column(
      children: [
        Text(
          "Irresistible Experience",
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

  Widget _buildInputField({
    required String label,
    required String hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
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

  Widget _buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(
              context,
              AppRoutes.loginVerification,
              arguments: {
                'email': _emailController.text,
                'password': _passwordController.text,
                'name': _nameController.text,
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.themeBgColor,
          foregroundColor: Colors.white,
        ),
        child: const Text("Register", style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildSocialLoginIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Image.asset('assets/images/apple_logo.png', width: 30),
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
          radius: 30,
          backgroundColor: Colors.white,
          child: Image.asset('assets/images/google_logo_sm.png', width: 30),
        ),
      ],
    );
  }

  Widget _buildFooterText() {
    return Builder(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an Account?  ",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
            child: const Text("Login Now", style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
