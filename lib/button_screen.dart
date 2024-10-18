// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  String _selectedValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {},
              child: Text(
                'Text Button',
                style: TextStyle(color: Colors.white),
              )),
          ElevatedButton(
              onPressed: () {}, child: const Text('Elevated Button')),
          OutlinedButton(onPressed: () {}, child: const Text('Outline Button')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
          DropdownButton<String>(
              value: _selectedValue,
              dropdownColor: Colors.redAccent,
              items: const [
                DropdownMenuItem(
                    value: '1',
                    child: Text(
                      'Item 1',
                      style: TextStyle(color: Colors.black),
                    )),
                DropdownMenuItem(
                    value: '2',
                    child: Text(
                      'Item 2',
                      style: TextStyle(color: Colors.black),
                    )),
                DropdownMenuItem(
                    value: '3',
                    child: Text(
                      'Item 3',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              })
        ],
      )),
    );
  }
}
