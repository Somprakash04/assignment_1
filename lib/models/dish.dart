// lib/models/dish.dart
// Removed unused flutter import

class Dish {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  bool isFavorite;

  Dish({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    this.isFavorite = false,
  });

  Dish copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    bool? isFavorite,
  }) {
    return Dish(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
