import 'package:flutter/material.dart';
import 'package:testproject/pages/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST VR SYSTEM',
      home: ProductsList(),
    );
  }
}
