import 'package:flutter/material.dart';
import 'package:scanalyze_app/pages/main_page.dart';
import 'package:scanalyze_app/pages/splash_page.dart';
import 'package:scanalyze_app/utils/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanalyze App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ScanalyzeColors.primaryColor),
        useMaterial3: true,
      ),
      // home: const SplashPage(),
      routes: {
        '/': (context) => const MainPage(),
        '/home': (context) => const MainPage(),
      },
    );
  }
}
