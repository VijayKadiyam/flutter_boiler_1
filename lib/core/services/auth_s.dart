import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_cms_app_1/core/providers/config_pr.dart';
import 'package:v_cms_app_1/locator.dart';

class AuthService {
  final ConfigModel _configModel = locator<ConfigModel>();

  Future<void> getLoggedInUser(
      {@required Map<String, dynamic>? loginData}) async {
    Map<String, dynamic> _apiConfig = _configModel.apiConfig;

    http.Response _response = await http.post(
      Uri.parse('${_apiConfig['baseURL']}/login'),
      body: json.encode(loginData),
      headers: _apiConfig['headers'],
    );

    Map<String, dynamic> _responseData = json.decode(_response.body);

    if (_responseData['success'] == null) {
    } else if (_responseData['success']) {
      await _configModel.saveLoginData(newLoginData: loginData);
    }
    _configModel.saveUserData(responseData: _responseData);
  }
}
