import 'package:clothes_app/screens/drawer_screens/mainpage.dart';
import 'package:clothes_app/screens/drawer_screens/mycart.dart';
import 'package:clothes_app/screens/drawer_screens/shop.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List _pages = [
    MainPage(),
    Cart(),
    Shop(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerUI(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: new Text('Info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: new Text('Person'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.blue[300],
      ),
      body: _pages[_currentIndex],
    );
  }
}
