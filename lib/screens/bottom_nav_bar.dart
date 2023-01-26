import 'package:aplikasipertama/screens/cart/cart_page.dart';
import 'package:aplikasipertama/screens/home/home_page.dart';
import 'package:aplikasipertama/screens/save/save_page.dart';
import 'package:aplikasipertama/screens/user/user_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const nameRoute = "/";
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final _screens = [
    HomePage(),
    SavePage(),
    CartPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Widget customBottomNav() {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
                // ignore: avoid_unnecessary_containers
                icon: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Icon(
                    Icons.home,
                    size: 25,
                    color: _selectedIndex == 0 ? Colors.green : Colors.grey,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                // ignore: avoid_unnecessary_containers
                icon: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Icon(Icons.bookmark_border,
                      size: 25,
                      color: _selectedIndex == 1 ? Colors.green : Colors.grey),
                ),
                label: ""),
            BottomNavigationBarItem(
                // ignore: avoid_unnecessary_containers
                icon: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Icon(Icons.shopping_bag_outlined,
                      size: 25,
                      color: _selectedIndex == 2 ? Colors.green : Colors.grey),
                ),
                label: ""),
            BottomNavigationBarItem(
                // ignore: avoid_unnecessary_containers
                icon: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Icon(Icons.person_outline_sharp,
                      size: 25,
                      color: _selectedIndex == 3 ? Colors.green : Colors.grey),
                ),
                label: "")
          ]);
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
          children: _screens
              .asMap()
              .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: _selectedIndex != i,
                    child: screen,
                  )))
              .values
              .toList()),
    );
  }
}
