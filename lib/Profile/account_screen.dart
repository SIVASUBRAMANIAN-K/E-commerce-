import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SettingsOption(
            icon: Icons.lock_outline,
            title: 'Change Password',
            onTap: () => Navigator.pushNamed(context, '/cpassword'),
          ),
          SettingsOption(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Settings',
            onTap: () => Navigator.pushNamed(context, '/psettings'),
          ),
          SettingsOption(
            icon: Icons.notifications_none,
            title: 'Notifications',
            onTap: () => Navigator.pushNamed(context, '/notification'),
          ),
          SettingsOption(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () => Navigator.pushNamed(context, '/help-support'),
          ),
          const SizedBox(height: 20),
          _buildLogoutTile(context),
        ],
      ),
    );
  }

  // Logout Tile Widget
  Widget _buildLogoutTile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Logout"),
            content: Text("Are you sure you want to logout?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/splash');
                  print("User logged out");
                },
                child: Text("Logout", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Icon(Icons.logout, color: Colors.red),
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
          trailing:
              Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black38),
        ),
      ),
    );
  }
}

// Reusable Widget for Each Setting Option
class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black38),
        onTap: onTap,
      ),
    );
  }
}
