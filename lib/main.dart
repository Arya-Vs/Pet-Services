import 'package:flutter/material.dart';
import 'package:pet_services/routes/routes_config.dart'; // Make sure this import path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesConfig.returnRouter(),
      title: 'Pet Services',
      debugShowCheckedModeBanner: false,
    );
  }
}
