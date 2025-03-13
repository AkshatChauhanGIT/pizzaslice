import 'package:flutter/material.dart';
import 'package:pizzaslice/core/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final _emailController =
      TextEditingController(); // Controller for email field
  final _passwordController =
      TextEditingController(); // Controller for password field
  bool _isLoading = false; // To track loading state

  // Function to call the login API
  Future<void> _loginUser(String email, String password) async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login successful: message')));
    } catch (e) {
      // Handle network or other errors
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey, // Assign the form key
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
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Password Field
                _buildInputField(
                  label: "Password",
                  hintText: "Enter your password",
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
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
        style: TextStyle(fontSize: 40, color: AppTheme.themeBgColorLight),
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
          obscureText: isPassword,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: isPassword
                ? const Icon(Icons.visibility_off, color: Colors.grey)
                : null,
          ),
          validator: validator,
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
        onPressed:
            _isLoading
                ? null // Disable button when loading
                : () async {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, proceed with login
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    // Call the API
                    await _loginUser(email, password);
                  }
                },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.themeBgColor,
          foregroundColor: Colors.white,
        ),
        child:
            _isLoading
                ? const CircularProgressIndicator(
                  color: Colors.white,
                ) // Show loading indicator
                : const Text("Login", style: TextStyle(fontSize: 16)),
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
          child: Image.asset('assets/images/google-logo-sm.png', width: 20),
        ),
      ],
    );
  }

  // Footer Text Widget
  Widget _buildFooterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an Account, ",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        OutlinedButton(
          onPressed: () {
            /* will handle onclick here */
          },
          child: const Text(
            "Register",
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
