import 'package:flutter/material.dart';
import 'core/theme.dart'; // Import the theme
import 'presentation/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Slice',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Use global theme
      initialRoute: AppRoutes.home, // Set the starting screen
      routes: AppRoutes.routes, // Use the defined routes
    );
  }
}
