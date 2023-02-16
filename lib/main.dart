import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/view/CheckoutPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckOutPage(),
    );
  }
}