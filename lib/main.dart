import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/pages/signup_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      title: 'Flutter Clean Architecture',
      debugShowCheckedModeBanner: false,
      home: const SignupPage(),
    );
  }
}
