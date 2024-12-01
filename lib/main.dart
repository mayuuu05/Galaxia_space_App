import 'package:flutter/material.dart';
import 'package:space_app_galaxia/screens/splash/splash_screen.dart';

void main() {
  runApp(const GalaxiaApp());
}

class GalaxiaApp extends StatelessWidget {
  const GalaxiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

