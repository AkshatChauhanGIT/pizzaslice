import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserPreferences {
  static const String _keyUsers = 'users';
  static const String _keyCurrentUser = 'currentUser';

  // Create/Register User
  static Future<bool> saveUser({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Get existing users
      final List<String> usersJson = prefs.getStringList(_keyUsers) ?? [];
      final List<Map<String, dynamic>> users = usersJson
          .map((str) => json.decode(str) as Map<String, dynamic>)
          .toList();

      // Check if email already exists
      if (users.any((user) => user['email'] == email)) {
        return false; // User already exists
      }

      // Add new user
      final newUser = {
        'email': email,
        'name': name,
        'password': password, // In real app, hash this!
      };

      users.add(newUser);
      
      // Save updated users list
      final updatedUsersJson = users
          .map((user) => json.encode(user))
          .toList();
      await prefs.setStringList(_keyUsers, updatedUsersJson);
      
      return true;
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  // Login User
  static Future<bool> loginUser(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> usersJson = prefs.getStringList(_keyUsers) ?? [];
      final List<Map<String, dynamic>> users = usersJson
          .map((str) => json.decode(str) as Map<String, dynamic>)
          .toList();

      // Find user with matching email and password
      final userExists = users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => {},
      );

      if (userExists.isNotEmpty) {
        // Save current user
        await prefs.setString(_keyCurrentUser, json.encode(userExists));
        return true;
      }
      return false;
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }

  // Get Current User
  static Future<Map<String, dynamic>> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString(_keyCurrentUser);
    if (userJson != null) {
      return json.decode(userJson);
    }
    return {};
  }

  // Check if user exists
  static Future<bool> checkUserExists(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> usersJson = prefs.getStringList(_keyUsers) ?? [];
    final List<Map<String, dynamic>> users = usersJson
        .map((str) => json.decode(str) as Map<String, dynamic>)
        .toList();

    return users.any((user) => user['email'] == email);
  }

  // Get all users (for debugging)
  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> usersJson = prefs.getStringList(_keyUsers) ?? [];
    return usersJson
        .map((str) => json.decode(str) as Map<String, dynamic>)
        .toList();
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCurrentUser);
  }

  // Clear all users (for debugging)
  static Future<void> clearAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsers);
    await prefs.remove(_keyCurrentUser);
  }
} 