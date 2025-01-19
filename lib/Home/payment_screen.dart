import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = 'Credit/Debit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Section
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.grey.shade100, // Add background color here
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryRow('Subtotal', '₹2000'),
                    SizedBox(height: 8),
                    _buildSummaryRow('Shipping Fee', '₹50'),
                    SizedBox(height: 8),
                    _buildSummaryRow('Discount', '-₹100'),
                    Divider(),
                    _buildSummaryRow(
                      'Total',
                      '₹1950',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Payment Methods Section
            Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentMethod('Credit/Debit Card', Icons.credit_card),
            _buildPaymentMethod('UPI', Icons.account_balance_wallet),
            _buildPaymentMethod('Wallet', Icons.wallet),
            SizedBox(height: 20),

            // Confirm Payment Button
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _handlePayment();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Confirm Payment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod(String method, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = method;
        });
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: selectedPaymentMethod == method
            ? Colors.blueAccent.withOpacity(0.2)
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 28, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                method,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              if (selectedPaymentMethod == method)
                Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePayment() {
    // Mock payment process
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Confirmed'),
        content: Text(
            'Your payment of ₹1950 using $selectedPaymentMethod has been successful!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/order');
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
