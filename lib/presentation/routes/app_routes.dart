import 'package:flutter/material.dart';
import 'package:pizzaslice/presentation/screens/home/home_screen.dart';
import 'package:pizzaslice/presentation/screens/login/login_screen.dart';
import 'package:pizzaslice/presentation/screens/register/register_screen.dart';
import 'package:pizzaslice/presentation/screens/dashboard/dashboard_screen.dart';


class AppRoutes {
  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String register = '/register';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    dashboard: (context) => const DashboardScreen(),
    register: (context) => const RegisterScreen(),
  };
}
