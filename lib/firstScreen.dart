// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:try_flutter/returnDataScreen.dart';
import 'package:try_flutter/secondScreen.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Secondscreen(),
                  ),
                );
              },
              child: Text('Go to Second Screen'),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Go to Named Second Screen'),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pushNamed(context, '/arguments',
                    arguments: 'Halo dari First Screen');
              },
              child: Text('Go to Arguments Screen'),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                _returnData();
              },
              child: Text('Go to Return Data Screen'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _returnData() async {
    final result = await Navigator.pushNamed(context, '/return-data');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$result'),
      ),
    );
  }
}
