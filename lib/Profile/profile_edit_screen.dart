import 'package:flutter/material.dart';

class ProfileEditingScreen extends StatelessWidget {
  const ProfileEditingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildProfileImageSection(),
              const SizedBox(height: 20),
              _buildTextField('Full Name', 'Siva Subramanian K'),
              const SizedBox(height: 20),
              _buildTextField('Email', 'siva@example.com'),
              const SizedBox(height: 20),
              _buildTextField('Phone', '+123 456 7890'),
              const SizedBox(height: 30),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(
              'assets/placeholder.png'), // Update this with your image
          backgroundColor: Colors.grey.shade200,
        ),
        const SizedBox(height: 10),
        Text(
          'Change Profile Picture',
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return TextFormField(
      initialValue: hint,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle the save action
        print("Profile updated");
        Navigator.pop(context); // Go back to the previous screen
      },
      child: Text(
        'Save Changes',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
