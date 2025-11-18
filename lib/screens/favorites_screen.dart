// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        leading: BackButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        }),
      ),
      body: const Center(child: Text('Favorites Screen')),
    );
  }
}