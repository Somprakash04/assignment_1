// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: BackButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        }),
      ),
      body: const Center(child: Text('Cart Screen')),
    );
  }
}