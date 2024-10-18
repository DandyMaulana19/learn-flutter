import 'package:flutter/material.dart';
import 'package:try_flutter/layout2.dart';

class Page_View extends StatelessWidget {
  const Page_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: [
        const ViewSatu(),
        const ViewDua(),
        const ViewTiga(),
        Container(
          child: const Center(
            child: Column(),
          ),
        )
      ]),
    );
  }
}
