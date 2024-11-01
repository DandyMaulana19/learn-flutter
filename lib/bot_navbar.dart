// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:try_flutter/button_screen.dart';

class BotNavbar extends StatefulWidget {
  const BotNavbar({super.key});

  @override
  State<BotNavbar> createState() => _BotNavbarState();
}

class _BotNavbarState extends State<BotNavbar> {
  int _selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    ButtonScreen(),
    Text(
      'Halaman 2',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    Text(
      "Halaman 3",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Flutter"),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text('Menu 1')),
                PopupMenuItem(child: Text('Menu 2')),
                PopupMenuItem(child: Text('Menu 3')),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
