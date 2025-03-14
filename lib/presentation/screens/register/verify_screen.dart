import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pizzaslice/core/theme.dart';
import 'package:pizzaslice/presentation/routes/app_routes.dart';

class LoginVerificationScreen extends StatefulWidget {
  const LoginVerificationScreen({super.key});

  @override
  State<LoginVerificationScreen> createState() => _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            _buildProfileAvatar(),
            const SizedBox(height: 16),
            _buildTitleSection(),
            const SizedBox(height: 32),
            _buildOtpInput(),
            const SizedBox(height: 16),
            _buildVerificationMessage(),
            const SizedBox(height: 32),
            _buildVerifyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.orange,
      child: Text(
        "U",
        style: TextStyle(fontSize: 40, color: Colors.white),
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
          style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildOtpInput() {
    return Pinput(
      length: 6,
      controller: _otpController,
      focusNode: _otpFocusNode,
      defaultPinTheme: PinTheme(
        width: 50,
        height: 50,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: TextInputType.number,
      onCompleted: (pin) => debugPrint("OTP Entered: $pin"), // Replaced print()
    );
  }

  Widget _buildVerificationMessage() {
    return const Text(
      "We've sent a secret code to this email for verification. If it's missing, check your spam folder or make sure we're not on your blocked list.",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, color: Colors.grey),
    );
  }

  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the next screen after OTP verification
          Navigator.pushNamed(context, AppRoutes.home);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.themeBgColor,
          foregroundColor: AppTheme.buttonText, // Fixed incorrect getter
        ),
        child: const Text("Let's Go...", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
