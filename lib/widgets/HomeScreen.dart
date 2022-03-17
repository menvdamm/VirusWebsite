import 'package:flutter/material.dart';

import 'MenuButton.dart';
import 'RNAScreen.dart';
import 'ProteinScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: const [
              Text(
                  "RNA virus evolution",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),
              SizedBox(
                  height: 20
              ),
            ],
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("protein analysis",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text("RNA analysis",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            ProteinScreen(),
            RNAScreen(),
          ],
        ),
      ),
    );
  }
}

