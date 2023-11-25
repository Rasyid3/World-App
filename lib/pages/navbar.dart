import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/page1.dart';
import 'package:world_time/pages/page2.dart';
import 'package:world_time/pages/page3.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final screens = [
    Home(),
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Time'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Continents'),
          BottomNavigationBarItem(icon: Icon(Icons.airplanemode_active), label: 'Vacation'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
