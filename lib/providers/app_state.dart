// lib/providers/app_state.dart
import 'package:flutter/material.dart';
import '../models/dish.dart';
import '../models/category.dart';
import '../models/popular_item.dart';
import '../utils/constants.dart';

class AppState extends ChangeNotifier {
  final List<Dish> _dishes = [
    Dish(
      id: 'd1',
      name: 'Asparagus',
      imageUrl: Constants.asparagusImageUrl,
      rating: 5.0,
      reviewCount: 23,
    ),
  ];

  final List<Category> _categories = [
    Category(
      id: 'c1',
      title: 'Salads',
      iconData: Icons.local_dining,
      itemCount: 8,
    ),
    Category(
      id: 'c2',
      title: 'Beverages',
      iconData: Icons.local_cafe,
      itemCount: 12,
    ),
    Category(
      id: 'c3',
      title: 'Desserts',
      iconData: Icons.cake,
      itemCount: 7,
    ),
    Category(
      id: 'c4',
      title: 'Seafood',
      iconData: Icons.set_meal,
      itemCount: 5,
    ),
  ];

  final List<PopularItem> _popularItems = [
    PopularItem(
      id: 'p1',
      name: 'Pasta',
      imageUrl: 'https://images.unsplash.com/photo-1525755662778-989d0524087e',
      price: 12.99,
    ),
    PopularItem(
      id: 'p2',
      name: 'Burger',
      imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349',
      price: 10.50,
    ),
  ];

  List<Dish> get dishes => _dishes;
  List<Category> get categories => _categories;
  List<PopularItem> get popularItems => _popularItems;

  void toggleFavorite(String dishId) {
    final dishIndex = _dishes.indexWhere((dish) => dish.id == dishId);
    if (dishIndex != -1) {
      _dishes[dishIndex].isFavorite = !_dishes[dishIndex].isFavorite;
      notifyListeners();
    }
  }
}