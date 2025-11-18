// lib/models/category.dart
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final IconData iconData;
  final int itemCount;

  Category({
    required this.id,
    required this.title,
    required this.iconData,
    required this.itemCount,
  });
}