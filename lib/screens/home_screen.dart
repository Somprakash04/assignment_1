// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/dish_card.dart';
import '../widgets/category_card.dart';
import '../widgets/popular_item_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/favorites');
        break;
      case 2:
        Navigator.pushNamed(context, '/search');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/cart');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  void _onFavoriteToggle(String dishId) {
    Provider.of<AppState>(context, listen: false).toggleFavorite(dishId);
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    final dish = appState.dishes.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  // Notification action
                },
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dishes header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dishes',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View More',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            DishCard(dish: dish, onFavoriteToggle: _onFavoriteToggle),
            const SizedBox(height: 36),

            // Food Categories header
            const Text(
              'Food Categories',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
            ),
            const SizedBox(height: 14),
            // lib/screens/home_screen.dart (Food Categories snippet)
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: appState.categories.length,
                itemBuilder: (context, index) {
                  final cat = appState.categories[index];
                  return CategoryCard(category: cat);
                },
              ),
            ),
            const SizedBox(height: 36),

            // Popular Items header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Items',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View More',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Column(
              children:
                  appState.popularItems
                      .map((item) => PopularItemCard(popularItem: item))
                      .toList(),
            ),
            const SizedBox(height: 80), // spacing for bottom nav
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/search');
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.search),
      ),
    );
  }
}
