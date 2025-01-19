import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Privacy Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            PrivacyOptionTile(
              title: 'Enable Notifications',
              subtitle: 'Receive notifications from this app.',
            ),
            PrivacyOptionTile(
              title: 'Location Access',
              subtitle: 'Allow app to use your location.',
            ),
            PrivacyOptionTile(
              title: 'Camera Access',
              subtitle: 'Grant app access to your camera.',
            ),
            Divider(height: 40, thickness: 1),
            ListTile(
              title: Text(
                'Manage Blocked Accounts',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to blocked accounts screen
              },
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 110),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Handle reset functionality
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Reset Privacy Settings'),
                      content: Text(
                          'Are you sure you want to reset all privacy settings?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Reset logic here
                            Navigator.pop(context);
                          },
                          child: Text('Reset'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Reset to Default',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyOptionTile extends StatefulWidget {
  final String title;
  final String subtitle;

  const PrivacyOptionTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  _PrivacyOptionTileState createState() => _PrivacyOptionTileState();
}

class _PrivacyOptionTileState extends State<PrivacyOptionTile> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      value: isEnabled,
      onChanged: (value) {
        setState(() {
          isEnabled = value;
        });
      },
      activeColor: Colors.amber.shade600,
    );
  }
}
