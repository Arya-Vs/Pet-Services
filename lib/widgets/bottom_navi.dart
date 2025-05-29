import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: widget.selectedIndex,
      onTap: (index) {
        widget.onItemSelected(index);

        switch (index) {
          case 1:
            Navigator.pushNamed(context, '/home');
            break;
          case 2:
            Navigator.pushNamed(context, '/grooming');
            break;
          case 3:
            Navigator.pushNamed(context, '/veterinary');
            break;
          case 4:
            Navigator.pushNamed(context, '/boarding');
            break;
        }
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.deepOrange,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.pets),
          title: Text("Grooming"),
          selectedColor: Colors.deepOrange,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.medical_services),
          title: Text("veterinary"),
          selectedColor: Colors.deepOrange,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.home_work_outlined),
          title: Text("Boarding"),
          selectedColor: Colors.deepOrange,
        ),
      ],
    );
  }
}
