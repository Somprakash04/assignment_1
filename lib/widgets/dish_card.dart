// lib/widgets/dish_card.dart
import 'package:flutter/material.dart';
import '../models/dish.dart';
import '../utils/rating_stars.dart';
import '../utils/constants.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  final void Function(String) onFavoriteToggle;

  const DishCard({
    super.key,
    required this.dish,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    // Make image height responsive to screen width for better layout on different devices
    final imageHeight = MediaQuery.of(context).size.width * 0.6;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      dish.imageUrl.startsWith('http')
                          ? Image.network(
                            dish.imageUrl,
                            width: double.infinity,
                            height: imageHeight,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => Image.asset(
                                  Constants.offlineImage,
                                  width: double.infinity,
                                  height: imageHeight,
                                  fit: BoxFit.cover,
                                ),
                          )
                          : Image.asset(
                            dish.imageUrl,
                            width: double.infinity,
                            height: imageHeight,
                            fit: BoxFit.cover,
                          ),
                ),
              ),
            ),
            Positioned(
              right: 1,
              bottom: 1 ,
              child: GestureDetector(
                onTap: () => onFavoriteToggle(dish.id),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    dish.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: dish.isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          dish.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            RatingStars(rating: dish.rating),
            const SizedBox(width: 8),
            Text(
              '${dish.rating.toStringAsFixed(1)} (${dish.reviewCount} Reviews)',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
