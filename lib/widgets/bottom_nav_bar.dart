// lib/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.red : Colors.grey,
              ),
              onPressed: () => onTap(0),
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: currentIndex == 1 ? Colors.red : Colors.grey,
              ),
              onPressed: () => onTap(1),
            ),
            const SizedBox(width: 48), // gap for floating button
            Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: currentIndex == 3 ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => onTap(3),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: currentIndex == 4 ? Colors.red : Colors.grey,
              ),
              onPressed: () => onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}