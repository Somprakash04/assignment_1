// lib/widgets/popular_item_card.dart
import 'package:flutter/material.dart';
import '../models/popular_item.dart';
import '../utils/constants.dart';

class PopularItemCard extends StatelessWidget {
  final PopularItem popularItem;

  const PopularItemCard({super.key, required this.popularItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child:
                popularItem.imageUrl.startsWith('http')
                    ? Image.network(
                      popularItem.imageUrl,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Image.asset(
                            Constants.offlineImage,
                            width: 100,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                    )
                    : Image.asset(
                      popularItem.imageUrl,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              popularItem.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              '\$${popularItem.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
