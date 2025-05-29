import 'package:flutter/material.dart';
import 'package:pet_services/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Services',
      debugShowCheckedModeBanner: false,
      
      home: const OnboardingScreen(),
    );
  }
}
