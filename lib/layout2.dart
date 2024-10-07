// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Layout2 extends StatelessWidget {
  const Layout2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
          bottom: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.home_filled),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.account_box_outlined),
                  text: "Account",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "Alarm",
                ),
                Tab(
                  icon: Icon(Icons.home_filled),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.account_box_outlined),
                  text: "Account",
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: "Alarm",
                ),
              ]),
        ),
        body: TabBarView(children: [ViewSatu(), ViewDua(), ViewTiga()]),
      ),
    );
  }
}

class ViewTiga extends StatelessWidget {
  const ViewTiga({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("3"),
    );
  }
}

class ViewDua extends StatelessWidget {
  const ViewDua({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("2"),
    );
  }
}

class ViewSatu extends StatelessWidget {
  const ViewSatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.person),
              Text("Profile"),
              Icon(Icons.arrow_right_alt),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.settings),
              Text("Settings"),
              Icon(Icons.arrow_right_alt),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.logout),
              Text("Logout"),
              Icon(Icons.arrow_right_alt),
            ],
          ),
        ],
      ),
    );
  }
}
