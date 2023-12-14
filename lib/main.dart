import 'package:flutter/material.dart';
import './Screens/ProductListScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key); // Fixing the constructor signature

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App', // Change this to your desired app title
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Add any desired theme configurations
      ),
      home: ProductListScreen(), // Set your ProductListScreen as the home screen
    );
  }
}
