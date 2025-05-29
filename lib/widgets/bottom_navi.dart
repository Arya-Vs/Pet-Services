import 'package:flutter/material.dart';
import 'package:pet_services/screens/adoption.dart';
import 'package:pet_services/screens/grooming.dart';
import 'package:pet_services/screens/service.dart';
import 'package:pet_services/screens/home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    GroomingScreen(),
    ServiceListingScreen(),
    PetAdoptionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.pets),
            title: const Text("Grooming"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.medical_services),
            title: const Text("Services"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_work_outlined),
            title: const Text("Adoption"),
            selectedColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
