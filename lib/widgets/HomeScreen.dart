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
          toolbarHeight: 120,
          backgroundColor: Colors.grey,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              const Text(
                  "RNA virus evolution",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
              ),
              const SizedBox(
                  height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  const Text(
                    "Choose a virus:",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  MenuButton(
                    options: const ["Influenza A", "Sars-CoV-2"],
                    selection: "Influenza A",
                    textcolor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "RNA analysis",
              ),
              Tab(
                text: "protein analysis",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            RNAScreen(),
            ProteinScreen()
          ],
        ),
      ),
    );
  }
}

