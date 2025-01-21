import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1; // Set 1 as default index since it's the Search screen

  List<String> recentSearches = [
    'Wedding Gifts',
    'Colour Pops',
    'Dual Name Plank',
    'Moon Lamps',
    'Special Combos'
  ];
  List<String> popularCategories = [
    'Colour Pops',
    'Pet Tags',
    'Dual Name Plank',
    'Wedding Gifts',
    'Toys'
  ];
  List<Map<String, String>> trendingProducts = [
    {'name': 'Dual Name Plank', 'image': 'assets/images/trending0.jpg'},
    {'name': 'Colour Pops', 'image': 'assets/images/trending1.jpg'},
    {'name': 'Anniversary Gifts', 'image': 'assets/images/trending2.jpg'},
    {'name': 'Special Combos', 'image': 'assets/images/trending3.jpg'},
    {'name': 'Birthday Gifts', 'image': 'assets/images/trending4.jpg'},
    {'name': 'Wedding Gifts', 'image': 'assets/images/trending5.jpg'},
    {'name': 'Name Planks', 'image': 'assets/images/trending6.jpg'},
    {'name': 'Moon Lamps', 'image': 'assets/images/trending7.jpg'},
    {'name': 'Pet Tags', 'image': 'assets/images/trending8.jpg'},
  ];

  String query = "";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate based on the selected index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // Already on Search Screen
        break;
      case 2:
        Navigator.pushNamed(context, '/wishlist');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search for products",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recent Searches
            if (recentSearches.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Searches',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: recentSearches.map((search) {
                      return Chip(
                        backgroundColor: Colors.white,
                        label: Text(search),
                        deleteIcon: Icon(Icons.close),
                        onDeleted: () {
                          setState(() {
                            recentSearches.remove(search);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            SizedBox(height: 16),

            // Popular Categories
            Text(
              'Popular Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: popularCategories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),

            // Trending Products
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: trendingProducts.length,
                itemBuilder: (context, index) {
                  final product = trendingProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: _buildShimmerImage(product['image']!),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product['name']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerImage(String assetPath) {
    return Image.asset(
      assetPath,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
