import 'package:flutter/material.dart';
import 'package:pet_services/widgets/groom_widget/booking.dart';
import 'package:pet_services/widgets/groom_widget/groom_category.dart';
import 'package:pet_services/widgets/groom_widget/grooming_card.dart';

class GroomingScreen extends StatefulWidget {
  const GroomingScreen({super.key});

  @override
  State<GroomingScreen> createState() => _GroomingScreenState();
}

class _GroomingScreenState extends State<GroomingScreen> {
  String selectedCategory = "Cat";

  final List<Map<String, String>> pets = [
    {
      "name": "Dos Salon",
      "breed": "American Bully",
      "service": "Full Groom",
      "rate": "4,500",
      "location": "Kasaragod",
      "image": "assets/images/image5.jpeg",
      "phone": "1234567890",
      "category": "Cat",
    },
    {
      "name": "Pet Spa",
      "breed": "Boxer",
      "service": "Bath & Brush",
      "rate": "3,000",
      "location": "Palakkad",
      "image": "assets/images/image5.jpeg",
      "phone": "9876543210",
      "category": "Cat",
    },
    {
      "name": "Pet Groomers",
      "breed": "Golden Retriever",
      "service": "Hair Trim",
      "rate": "5,000",
      "location": "Kollam",
      "image": "assets/images/image5.jpeg",
      "phone": "4445556666",
      "category": "Cat",
    },
    {
      "name": "Happy Tails Grooming",
      "breed": "Labrador Retriever",
      "service": "Nail Clipping",
      "rate": "2,500",
      "location": "Wayanad",
      "image": "assets/images/image6.jpeg",
      "phone": "5551234567",
      "category": "Cat",
    },
    {
      "name": "Pawfect Style",
      "breed": "Poodle",
      "service": "Full Groom",
      "rate": "6,000",
      "location": "Thrissur",
      "image": "assets/images/image7.jpeg",
      "phone": "8882223333",
      "category": "Dog",
    },
    {
      "name": "Furry Friends Spa",
      "breed": "Beagle",
      "service": "Bath & Brush",
      "rate": "3,500",
      "location": "Ernakulam",
      "image": "assets/images/image8.jpeg",
      "phone": "3216540987",
      "category": "Cat",
    },
    {
      "name": "Doggy Delight",
      "breed": "German Shepherd",
      "service": "Hair Trim",
      "rate": "5,000",
      "location": "Kannur",
      "image": "assets/images/image9.jpeg",
      "phone": "1112223333",
      "category": "Cat",
    },
    {
      "name": "Woof & Wash",
      "breed": "Bulldog",
      "service": "Ear Cleaning",
      "rate": "4,800",
      "location": "Pathanamthitta",
      "image": "assets/images/image10.jpeg",
      "phone": "6667778888",
      "category": "Dog",
    },
  ];

  final List<String> categories = [
    "Cat",
    "Dog",
    "Parrot",
    "Rabbit",
    "Hamster",
    "Turtle",
    "Fish",
    "Guinea Pig",
    "Ferret",
  ];

  void _handleBookNow(String petName) {
    final pet = pets.firstWhere((p) => p["name"] == petName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => GroomingItemDetailScreen(
              name: pet["name"] ?? "",
              breed: pet["breed"] ?? "",
              service: pet["service"] ?? "",
              rate: pet["rate"] ?? "",
              location: pet["location"] ?? "",
              number: pet["phone"] ?? "",
              image: pet["image"] ?? "",
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> filteredPets =
        pets.where((pet) => pet["category"] == selectedCategory).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.cut, color: Colors.deepOrange),
                    SizedBox(width: 4),
                    Text(
                      "Grooming Now",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      categories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: CategoryIcon(
                            icon: Icons.pets,
                            label: category,
                            selected: selectedCategory == category,
                          ),
                        );
                      }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GroomingItemCardList(
                  pets: filteredPets,
                  onBookNow: _handleBookNow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
