import 'package:flutter/material.dart';
import 'package:just_for_test/account.dart';
import 'package:just_for_test/cart.dart';
import 'package:just_for_test/explore.dart';
import 'package:just_for_test/favorite.dart';
import 'package:just_for_test/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 2;

  List<Widget> screens = [
    ExploreScreen(),
    FavoriteScreen(),
    Home(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _currentIndex = 2),
        shape: const CircleBorder(),
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () => setState(() => _currentIndex = 0),
              icon: Icon(Icons.grid_view_outlined),
              color:
                  _currentIndex == 0 ? Colors.blueGrey : Colors.grey.shade400,
            ),
            IconButton(
              onPressed: () => setState(() => _currentIndex = 1),
              icon: Icon(Icons.favorite_border),
              color:
                  _currentIndex == 1 ? Colors.blueGrey : Colors.grey.shade400,
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () => setState(() => _currentIndex = 3),
              icon: Icon(Icons.shopping_cart_checkout),
              color:
                  _currentIndex == 3 ? Colors.blueGrey : Colors.grey.shade400,
            ),
            IconButton(
              onPressed: () => setState(() => _currentIndex = 4),
              icon: Icon(Icons.person),
              color:
                  _currentIndex == 4 ? Colors.blueGrey : Colors.grey.shade400,
            ),
          ],
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}
