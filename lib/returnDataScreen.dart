import 'package:flutter/material.dart';
import 'package:try_flutter/firstScreen.dart';

class Returndatascreen extends StatefulWidget {
  const Returndatascreen({super.key});

  @override
  State<Returndatascreen> createState() => _ReturndatascreenState();
}

class _ReturndatascreenState extends State<Returndatascreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Halo dari Screen Lain');
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
