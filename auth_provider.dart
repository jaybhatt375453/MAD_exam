import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  AppUser? user;

  Future<bool> login(String email, String password) async {
    // Dummy login: assigns role based on email content
    user = AppUser(
      uid: 'dummy',
      email: email,
      role: email.contains('admin') ? 'admin' : 'operator',
    );
    notifyListeners();
    return true;
  }

  void logout() {
    user = null;
    notifyListeners();
  }
}