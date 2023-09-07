import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:v_cms_app_1/core/providers/auth_pr.dart';
import 'package:v_cms_app_1/core/providers/config_pr.dart';
import 'package:v_cms_app_1/locator.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  authenticateUser(_, AuthModel authModel, ConfigModel configModel) async {
    configModel.getApiConfig(domain: 'http://api.bd.aaibuzz.com');
    await configModel.fetchLoginData();

    String currentAppVersion = await getPackageDetails();

    if (configModel.loginData.isEmpty) {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacementNamed(context, '/login'),
      );
    } else {
      await authModel.login(loginData: configModel.loginData);

      debugPrint('APP: $currentAppVersion');
      debugPrint('API: ${configModel.currentAndroidVersionFromApi}');

      if (configModel.isLoggedIn) {
        if (currentAppVersion != configModel.currentAndroidVersionFromApi) {
          Future.delayed(
            Duration.zero,
            () => Navigator.pushReplacementNamed(context, '/updateApp'),
          );
        } else {
          Future.delayed(
            Duration.zero,
            () => Navigator.pushReplacementNamed(context, '/home'),
          );
        }
      } else {
        Future.delayed(
          Duration.zero,
          () => Navigator.pushReplacementNamed(context, '/login'),
        );
      }
    }
  }

  getPackageDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final _authModel = Provider.of<AuthModel>(context, listen: false);
      final _configModel = locator<ConfigModel>();
      authenticateUser(context, _authModel, _configModel);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root Page'),
      ),
    );
  }
}
