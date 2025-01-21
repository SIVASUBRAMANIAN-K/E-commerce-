import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isDarkMode = false;

  // ignore: unused_field
  final List<Widget> _pages = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Wishlist')),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/search');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/profile');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/wishlist');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        title: Text(
          'Layer Labs',
          style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: Icon(
              _isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CarouselSlider(
                items: [
                  _buildShimmerImage('assets/images/carousel1.jpg'),
                  _buildShimmerImage('assets/images/carousel2.jpg'),
                  _buildShimmerImage('assets/images/carousel3.jpg'),
                ],
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            // Categories Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryCard(
                        'DUAL NAME \n PLANKS ❤️', Icons.favorite_border),
                    SizedBox(width: 16),
                    _buildCategoryCard('COLOUR \n POPS 🎨', Icons.palette),
                    SizedBox(width: 16),
                    _buildCategoryCard(
                        'ANNIVERSARY \n     GIFTS 🤩', Icons.star),
                    SizedBox(width: 16),
                    _buildCategoryCard(
                        'BIRTHDAY \n GIFTS 🎁', Icons.card_giftcard),
                    SizedBox(width: 16),
                    _buildCategoryCard('WEDDING \n GIFTS 💍', Icons.diamond),
                    SizedBox(width: 16),
                    _buildCategoryCard(
                        'MOON LAMPS \n         🌖', Icons.nightlight_round),
                    SizedBox(width: 16),
                    _buildCategoryCard('Pet Tags \n     🐕', Icons.pets),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trending Products",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildTrendingProductCard(index);
                },
              ),
            ),

            // Product Grid Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      color: _isDarkMode ? Colors.grey[800] : Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: _buildShimmerImage(
                                  'assets/images/product$index.jpg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product $index',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  '₹ ${(index + 1) * 999}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _isDarkMode ? Colors.white : Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: _isDarkMode ? Colors.white : Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
                color: _isDarkMode ? Colors.white : Colors.black),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _isDarkMode ? Colors.white : Colors.black),
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

  Widget _buildCategoryCard(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: _isDarkMode ? Colors.grey[800] : Colors.white,
          child: Icon(icon,
              color: _isDarkMode ? Colors.white : Colors.black, size: 30),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
              fontSize: 12, color: _isDarkMode ? Colors.white : Colors.black),
        ),
      ],
    );
  }

  Widget _buildTrendingProductCard(int index) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: _isDarkMode ? Colors.grey[800] : Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: _buildShimmerImage('assets/images/trending$index.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Trending Product $index',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
