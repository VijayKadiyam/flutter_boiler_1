import 'package:flutter/material.dart';
import 'package:v_cms_app_1/ui/routing/routes.dart';
import 'package:v_cms_app_1/ui/views/auth/login_p.dart';
import 'package:v_cms_app_1/ui/views/home_p.dart';
import 'package:v_cms_app_1/ui/views/root_p.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case root:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const RootPage();
      });
    case home:
      return MaterialPageRoute(builder: (BuildContext context) {
        return HomePage();
      });
    case login:
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });
    // case updateApp:
    //   return MaterialPageRoute(builder: (BuildContext context) {
    //     return UpdateAppPage();
    //   });
    // case profile:
    //   return MaterialPageRoute(builder: (BuildContext context) {
    //     return ProfilePage();
    //   });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      });
  }
}
