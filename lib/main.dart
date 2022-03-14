import 'package:flutter/material.dart';

import 'widgets/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Website',
      theme: ThemeData(
        //brightness: Brightness.dark,
        //primaryColor: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}