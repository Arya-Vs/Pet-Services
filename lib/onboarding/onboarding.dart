import 'package:flutter/material.dart';
import 'package:pet_services/widgets/bottom_navi.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
    'assets/images/image4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentPage == index ? 25 : 10,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index ? Colors.black : Colors.grey[400],
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
          ),

          if (_currentPage == images.length - 1)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },

                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
