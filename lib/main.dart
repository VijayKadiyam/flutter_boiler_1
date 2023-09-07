import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_cms_app_1/core/providers/auth_pr.dart';
import 'package:v_cms_app_1/core/providers/config_pr.dart';
import 'package:v_cms_app_1/locator.dart';
import 'package:v_cms_app_1/ui/routing/router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConfigModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
