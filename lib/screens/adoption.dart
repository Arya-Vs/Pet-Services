import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetAdoptionScreen extends StatefulWidget {
  const PetAdoptionScreen({Key? key}) : super(key: key);

  @override
  State<PetAdoptionScreen> createState() => _PetAdoptionScreenState();
}

class _PetAdoptionScreenState extends State<PetAdoptionScreen> {
  final List<Map<String, String>> pets = [
    {
      'name': 'Baby Dog',
      'image': 'assets/images/image1.jpeg',
      'phone': '1234567890',
    },
    {
      'name': 'Cute Cat',
      'image': 'assets/images/image8.jpeg',
      'phone': '1234567890',
    },
    {
      'name': 'Sweet Puppy',
      'image': 'assets/images/image2.jpeg',
      'phone': '1234567890',
    },
    {
      'name': 'Tiny Dog',
      'image': 'assets/images/image3.jpeg',
      'phone': '1234567890',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Adoption',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick Up The Right Pet',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Before adopting a new pet, make sure that it is the right one for you',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/image20.png',
                      width: 250,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'New Pets',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pets.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 3.8,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          pets[index]['image']!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        pets[index]['name']!,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        pets[index]['phone']!,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
