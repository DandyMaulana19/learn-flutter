import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    Text(
      'Halaman Home',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Text(
      'Halaman Email',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Text(
      'Halaman Profile',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ];

  static const List<String> titles = <String>[
    'Home Page',
    'Email Page',
    'Profile Page',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(titles[_selectedIndex]),
        ),
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.house),
                label: "Home",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.email),
                label: "Email",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.green),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.green,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
