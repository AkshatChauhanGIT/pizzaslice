import 'package:flutter/material.dart';
import 'package:pizzaslice/presentation/screens/home/home_screen.dart';
import 'package:pizzaslice/presentation/screens/login/login_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    login: (context) => const LoginScreen(),
  };
}
