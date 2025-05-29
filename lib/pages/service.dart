import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceListingScreen extends StatefulWidget {
  @override
  _ServiceListingScreenState createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  String selectedCategory = 'All';

  final List<String> categories = ['All', 'Grooming', 'Veterinary', 'Training'];

  final List<Map<String, dynamic>> allServices = [
    {
      'image': 'assets/images/image2.jpeg',
      'name': 'Happy Tails Vet',
      'type': 'Veterinary',
      'rating': 4.8,
      'isOpen': true,
      'petTypes': ['Dog', 'Cat'],
    },
    {
      'image': 'assets/images/image3.jpeg',
      'name': 'Paws & Relax',
      'type': 'Grooming',
      'rating': 4.5,
      'isOpen': false,
      'petTypes': ['Dog'],
    },
    {
      'image': 'assets/images/image4.jpeg',
      'name': 'The Pet Academy',
      'type': 'Training',
      'rating': 4.2,
      'isOpen': true,
      'petTypes': ['Dog', 'Parrot'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filteredServices =
        selectedCategory == 'All'
            ? allServices
            : allServices
                .where((service) => service['type'] == selectedCategory)
                .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet Taxi Service',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                labelText: 'Select Category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items:
                  categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() => selectedCategory = value!);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                final service = filteredServices[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        service['image'],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      service['name'],
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service['type'],
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              '${service['rating']}',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 6,
                          children:
                              service['petTypes']
                                  .map<Widget>(
                                    (type) => Chip(
                                      label: Text(
                                        type,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: service['isOpen'] ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        service['isOpen'] ? 'Open' : 'Closed',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
