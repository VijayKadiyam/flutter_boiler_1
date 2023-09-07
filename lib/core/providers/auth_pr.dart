import 'package:flutter/material.dart';
import 'package:v_cms_app_1/core/services/auth_s.dart';
import 'package:v_cms_app_1/locator.dart';

class AuthModel with ChangeNotifier {
  final AuthService _authService = locator<AuthService>();

  Future<void> login({required Map<String, dynamic> loginData}) async {
    await _authService.getLoggedInUser(
      loginData: loginData,
    );
  }
}
