import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isLiked = false;
  String? selectedFileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              color: isLiked ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product details
              Container(
                height: 300,
                color: Colors.grey[200],
                child: Center(
                  child: Image.network(
                    'https://picsum.photos/300',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Product Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '₹ 500.00',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.green),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(' 4.8', style: TextStyle(fontSize: 14)),
                  SizedBox(width: 16),
                  Icon(Icons.thumb_up, color: Colors.green, size: 16),
                  Text(' 94%', style: TextStyle(fontSize: 14)),
                  SizedBox(width: 8),
                  Text('(117 reviews)',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              SizedBox(height: 16),

              Text(
                'Personalised Design: Two names, beautifully combined ✨',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),

              // File upload section
              Text(
                'Upload File',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: pickFile,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 110),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey.shade400, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.cloud_upload, size: 48, color: Colors.blue),
                      SizedBox(height: 8),
                      Text(
                        'Tap to upload file',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                      Text(
                        'or drag & drop',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              if (selectedFileName != null) ...[
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.file_present, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        selectedFileName!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
              ],
              SizedBox(height: 16),

              // Text field for custom input
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter text for customization',
                  hintText: 'Enter text for customization',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Add to Cart Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/cart'); // Add to cart logic
                    },
                    icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                    label: Text(
                      'Add to Cart',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.white,
                      elevation: 6,
                    ),
                  ),

                  // Place Order Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/cart'); // Place order logic
                    },
                    icon: Icon(Icons.shopping_bag, color: Colors.black),
                    label: Text(
                      'Place Order',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.white,
                      elevation: 6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
