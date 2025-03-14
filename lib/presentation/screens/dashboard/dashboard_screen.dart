import 'package:flutter/material.dart';
import 'package:pizzaslice/core/theme.dart';
import 'package:pizzaslice/core/utils/user_preferences.dart';
import 'package:pizzaslice/presentation/routes/app_routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppTheme.themeBgColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await UserPreferences.logout();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to Dashboard',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
} 