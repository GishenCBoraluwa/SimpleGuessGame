import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gussgame/pages/game_over.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myNumber = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "assets/background.jpg",
          ),
          fit: BoxFit.cover,
          opacity: 0.3,
        )),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Can you guess the number?",
                  style: TextStyle(fontSize: 40),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const GameOver())
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    int randomNumber = Random(10).nextInt(10) + 1;
    myNumber = randomNumber;
    super.initState();
  }
}
