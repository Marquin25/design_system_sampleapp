import 'package:flutter/material.dart';
import 'design_system/colors.dart';
import 'design_system/typography.dart';
import 'design_system/spacing.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System App',
      theme: ThemeData(
        primaryColor: DSColors.primary,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}