import 'package:flutter/material.dart';
import 'package:v_cms_app_1/core/providers/config_pr.dart';
import 'package:v_cms_app_1/locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigModel _configModel = locator<ConfigModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                await _configModel.removeLoginData();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
