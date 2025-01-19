import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Sample notifications data
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Order Shipped',
      'message': 'Your order #12345 has been shipped.',
      'timestamp': '2 hrs ago',
      'isRead': false,
      'icon': Icons.local_shipping,
    },
    {
      'title': 'New Message',
      'message': 'You have a new message from John.',
      'timestamp': '5 hrs ago',
      'isRead': true,
      'icon': Icons.message,
    },
    {
      'title': 'Payment Received',
      'message': 'We have received your payment of ₹500.',
      'timestamp': '1 day ago',
      'isRead': false,
      'icon': Icons.payment,
    },
  ];

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification['isRead'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Notifications'),
        actions: [
          TextButton(
            onPressed: markAllAsRead,
            child: Text(
              'Mark All as Read',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(
              notification['icon'],
              color: notification['isRead'] ? Colors.grey : Colors.blue,
            ),
            title: Text(
              notification['title'],
              style: TextStyle(
                fontWeight: notification['isRead']
                    ? FontWeight.normal
                    : FontWeight.bold,
              ),
            ),
            subtitle: Text(notification['message']),
            trailing: Text(
              notification['timestamp'],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            tileColor: notification['isRead'] ? Colors.grey[200] : Colors.white,
            onTap: () {
              setState(() {
                notification['isRead'] = true;
              });
            },
          );
        },
      ),
    );
  }
}
