import 'package:flutter/material.dart';

class GroomingItemCardList extends StatelessWidget {
  final List<Map<String, String>> pets;
  final Function(String) onBookNow;

  const GroomingItemCardList({
    required this.pets,
    required this.onBookNow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (pets.isEmpty) {
      return const Center(child: Text('No pets found for this category.'));
    }

    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        final pet = pets[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(pet["image"]!),
              radius: 30,
            ),
            title: Text(pet["name"]!),
            subtitle: Text("${pet["breed"]!} - ${pet["service"]!}"),
            trailing: ElevatedButton(
              onPressed: () => onBookNow(pet["name"]!),
              child: const Text("Book Now"),
            ),
          ),
        );
      },
    );
  }
}
