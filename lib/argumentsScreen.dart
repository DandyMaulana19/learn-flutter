import 'package:flutter/material.dart';
import 'package:try_flutter/firstScreen.dart';

class Argumentsscreen extends StatefulWidget {
  const Argumentsscreen({super.key});

  @override
  State<Argumentsscreen> createState() => _ArgumentsscreenState();
}

class _ArgumentsscreenState extends State<Argumentsscreen> {
  @override
  Widget build(BuildContext context) {
    final dataArgument = ModalRoute.of(context)!.settings.arguments as String;
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
            Text(dataArgument),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
