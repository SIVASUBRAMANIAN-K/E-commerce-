import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Map<String, dynamic>> wishlistItems = [
    {
      "id": 1,
      "name": "Product 1",
      "price": 499.99,
      "image": "https://picsum.photos/200",
      "description": "This is the description of Product 1."
    },
    {
      "id": 2,
      "name": "Product 2",
      "price": 299.99,
      "image": "https://picsum.photos/200",
      "description": "This is the description of Product 2."
    },
    {
      "id": 3,
      "name": "Product 3",
      "price": 199.99,
      "image": "https://picsum.photos/200",
      "description": "This is the description of Product 3."
    },
  ];

  int _selectedIndex = 2; // Default to 'Wishlist' tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Replace with your Home route
        break;
      case 1:
        Navigator.pushNamed(context, '/search'); // Replace with your Cart route
        break;
      case 2:
        // Already on the Wishlist screen
        break;
      case 3:
        Navigator.pushNamed(
            context, '/profile'); // Replace with your Profile route
        break;
    }
  }

  void removeFromWishlist(int id) {
    setState(() {
      wishlistItems.removeWhere((item) => item["id"] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Wishlist"),
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your wishlist is empty!",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.grey.shade100, // Add background color here
                  child: ListTile(
                    leading: Image.network(
                      item["image"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.broken_image,
                          size: 60,
                          color: Colors.grey,
                        );
                      },
                    ),
                    title: Text(item["name"]),
                    subtitle: Text("\$${item["price"]}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeFromWishlist(item["id"]),
                    ),
                    onTap: () {
                      // Navigate to the Product Page
                      Navigator.pushNamed(context, '/product');
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
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
}
