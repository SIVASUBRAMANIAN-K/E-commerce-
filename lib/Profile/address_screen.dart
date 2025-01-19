import 'package:flutter/material.dart';

class AddressManagementScreen extends StatefulWidget {
  const AddressManagementScreen({Key? key}) : super(key: key);

  @override
  State<AddressManagementScreen> createState() =>
      _AddressManagementScreenState();
}

class _AddressManagementScreenState extends State<AddressManagementScreen> {
  // Sample list of addresses
  List<Map<String, String>> addresses = [
    {
      "name": "Home",
      "address": "123, Main Street, City Center, New York, NY - 10001",
    },
    {
      "name": "Work",
      "address": "456, Corporate Plaza, Manhattan, New York, NY - 10005",
    },
  ];

  // Method to add a new address
  void _addAddress() {
    showDialog(
      context: context,
      builder: (context) => _buildAddressDialog(),
    );
  }

  // Method to edit an existing address
  void _editAddress(int index) {
    showDialog(
      context: context,
      builder: (context) => _buildAddressDialog(index: index),
    );
  }

  // Method to delete an address
  void _deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });
  }

  // Dialog to add or edit addresses
  Widget _buildAddressDialog({int? index}) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController(
      text: index != null ? addresses[index]['name'] : '',
    );
    final TextEditingController addressController = TextEditingController(
      text: index != null ? addresses[index]['address'] : '',
    );

    return AlertDialog(
      title: Text(index == null ? "Add Address" : "Edit Address"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a name' : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: addressController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the address' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel', style: TextStyle(color: Colors.black54)),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                if (index == null) {
                  addresses.add({
                    "name": nameController.text,
                    "address": addressController.text,
                  });
                } else {
                  addresses[index] = {
                    "name": nameController.text,
                    "address": addressController.text,
                  };
                }
              });
              Navigator.pop(context);
            }
          },
          child: Text(index == null ? "Add" : "Save"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Address Management"),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: addresses.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) => _buildAddressTile(index),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addAddress,
        label: Text("Add Address"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }

  // Empty State Widget
  Widget _buildEmptyState() {
    return Center(
      child: Text(
        "No addresses added yet!\nTap the + button to add one.",
        style: TextStyle(fontSize: 16, color: Colors.black54),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Address Tile Widget
  Widget _buildAddressTile(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        leading: Icon(Icons.location_on, color: Colors.black, size: 32),
        title: Text(
          addresses[index]['name']!,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          addresses[index]['address']!,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Edit') _editAddress(index);
            if (value == 'Delete') _deleteAddress(index);
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Edit',
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.black54),
                  SizedBox(width: 8),
                  Text("Edit")
                ],
              ),
            ),
            PopupMenuItem(
              value: 'Delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text("Delete")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
