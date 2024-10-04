// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Dandy_1201222032 extends StatelessWidget {
  const Dandy_1201222032({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            alignment: FractionalOffset(0, 0),
            margin: EdgeInsets.only(top: 100),
            // margin: EdgeInsets.only(),
            padding: EdgeInsets.all(20),
            // alignment: AlignmentDirectional(0, 0),
            color: Colors.red,
            child: Text(
              'RPL!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  color: Colors.purple,
                  height: 50,
                  width: 100,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
                Container(
                  color: Colors.pink,
                  height: 50,
                  width: 100,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
                Container(
                  color: Colors.teal,
                  height: 50,
                  width: 100,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
