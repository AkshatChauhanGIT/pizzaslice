import 'package:flutter/material.dart';
import 'package:pizzaslice/core/theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppTheme.themeBgColor,
        automaticallyImplyLeading: false, // Removes back button
      ),
      body: const Center(
        child: Text(
          'Welcome to Dashboard',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
} 