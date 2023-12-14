import 'package:flutter/material.dart';
import '../Services/networkservice.dart' as networkService;

class ProductEditScreen extends StatefulWidget {
  final dynamic product;

  ProductEditScreen({required this.product});

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product['name'];
    descriptionController.text = widget.product['description'];
    priceController.text = widget.product['price'].toString();
    quantityController.text = widget.product['quantity'].toString();
    categoryController.text = widget.product['category'];
  }

Future<void> updateProduct() async {
  // Prepare the updated product data
  Map<String, dynamic> updatedData = {
    'name': nameController.text,
    'description': descriptionController.text,
    'price': double.parse(priceController.text), // Convert to double if needed
    'quantity': int.parse(quantityController.text), // Convert to integer if needed
    'category': categoryController.text, // Include 'category' if needed
  };

  try {
    await networkService.ProductService.updateProduct(widget.product['_id'], updatedData);
    Navigator.pop(context); // Navigate back after updating
  } catch (e) {
    print('Error: $e');
    // Handle error
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateProduct(); // Call method to update product
              },
              child: Text('Update Product'),
            ),
          ],
        ),
      ),
    );
  }
}
