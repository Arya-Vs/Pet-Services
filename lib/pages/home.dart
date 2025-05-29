import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();


  
  final List<String> _routes = [
    '/home',
    '/grooming',
    '/veterinary',
    '/boarding',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the corresponding route
    Navigator.pushNamed(context, _routes[index]);
  }



  // Add this variable to keep track of current page
  int _currentPage = 0;

  final List<String> imageUrls = [
    'assets/images/image11.jpeg',
    'assets/images/image10.jpeg',
    'assets/images/image9.jpeg',
    'assets/images/image8.jpeg',
    // 'assets/images/image7.jpeg',
    'assets/images/image5.jpeg',
    
  ];

  final List<String>petCenter=[
    'assets/images/image16.jpeg',
    'assets/images/image17.jpeg',
    'assets/images/image18.jpeg',
    'assets/images/image19.jpeg',
  ];

  final List<String>popularCenters=[
    // 'assets/images/image12.jpeg',
    'assets/images/image13.jpeg',
    'assets/images/image14.jpeg',
    'assets/images/image15.jpeg',
  ];
  final List<String> categories = [
    'Grooming',
    'Boarding',
    'veterinary',
    'Training',
    'Adoption',
    'Vaccination',
    'Emergency Care',
    'Food',
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateToNextPage());
  }

  void _animateToNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      int nextPage = _currentPage + 1;
      if (nextPage >= imageUrls.length) {
        // Jump to first page without animation
        _pageController.jumpToPage(0);
        _currentPage = 0;
      } else {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _currentPage = nextPage;
      }
      _animateToNextPage(); // Recursive call
    });
  }

  Widget _buildCenterCard({
    required String imageUrl,
    required String name,
    required String location,
    required double rating,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$location\nRating: $rating'),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
          ),
          child: const Text('Book',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }

  Widget _buildFeaturedGridTile({
    required String imageUrl,
    required String name,
    required String location,
    required double rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: const TextStyle(fontSize: 12)),
                //star
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber.shade700),
                    const SizedBox(width: 4),
                    Text(rating.toString(), style: const TextStyle(fontSize: 13)),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      minimumSize: const Size(70, 30),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text('Book', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pet care', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 243, 100, 48),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for grooming, vet, or boarding',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),

              // Carousel with animation
              SizedBox(
                height: 160,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(imageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Categories
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text(categories[index])),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Featured Centers list
              const Text(
                'Popular Centers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildCenterCard(
                imageUrl: "assets/images/image15.jpeg",
                name: 'Pet Pals',
                location: 'Kochi, Kerala',
                
                rating: 4.8,
              ),
              _buildCenterCard(
                imageUrl: "assets/images/image14.jpeg",
                name: 'Pet Paradise',
                location: 'Kannur, Kerala',
                rating: 4.7,
              ),
              _buildCenterCard(
                imageUrl: "assets/images/image13.jpeg",
                name: 'Cats Cafe',
                location: 'Thrissur, kerala',
                rating: 4.5,
              ),
              const SizedBox(height: 16),

              // New GridView Section
              const Text(
                ' Pet Centers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.95,
                children: [
                  _buildFeaturedGridTile(
                    imageUrl: imageUrls[3],
                    name: 'Pawfect Groomers',
                    location: 'HSR Layout',
                    rating: 4.6,
                  ),
                  _buildFeaturedGridTile(
                    imageUrl:imageUrls[2],
                    name: 'Whiskers Boarding',
                    location: 'Jayanagar',
                    rating: 4.4,
                  ),
                  _buildFeaturedGridTile(
                    imageUrl:imageUrls[4],
                    name: 'The Vet Spot',
                    location: 'BTM Layout',
                    rating: 4.9,
                  ),
                  _buildFeaturedGridTile(
                    imageUrl: imageUrls[1] ,
                    name: 'Happy Tails Training',
                    location: 'Whitefield',
                    rating: 4.2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            title: const Text("Veterinary"),
            selectedColor: Colors.deepOrange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_work_outlined),
            title: const Text("Boarding"),
            selectedColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
