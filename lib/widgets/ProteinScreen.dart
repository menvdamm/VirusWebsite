import 'package:flutter/material.dart';

// import 'ProteinViewer.dart';
import 'MenuButton.dart';
import 'Tree.dart';

class ProteinScreen extends StatelessWidget {
  const ProteinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Choose a virus:",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              width: 30,
            ),
            MenuButton(
              options: const ["Influenza A", "Sars-CoV-2"],
              selection: "Influenza A",
            ),
            const SizedBox(
              width: 30,
            ),
            const Text(
              "Choose a protein:",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              width: 30,
            ),
            MenuButton(
              options: const ["Protein A", "Protein B"],
              selection: "Protein A",
            ),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                width: 100,
              ),
              SizedBox(
                width: 500,
                height: 500,
                child: Tree() ,
              )
            ],
          )

        ],)
    );
  }
}