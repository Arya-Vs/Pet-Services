import 'package:flutter/material.dart';

class GroomingItemDetailScreen extends StatelessWidget {
  final String name;
  final String breed;
  final String service;
  final String rate;
  final String location;
  final String number;
  final String image;

  const GroomingItemDetailScreen({
    required this.name,
    required this.breed,
    required this.service,
    required this.rate,
    required this.location,
    required this.number,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
        backgroundColor: Colors.deepOrange.shade200,
      ),
      body: SingleChildScrollView(
        
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Breed: $breed",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Service: $service",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Rate: $rate",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Location: $location",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Contact Number: $number",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange.shade300,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Booking request sent for $name!'),
                      backgroundColor: Colors.green, // GREEN COLOR ADDED
                    ),
                  );
                },
                child: const Text('Book Now',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
