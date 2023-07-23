import 'dart:math';

import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Guess the number if u can",
              style: TextStyle(fontSize: 20),
            ),
            const TextField(),
            ElevatedButton(
                onPressed: () {
                  //get the input from the user and convert it into int = guess number

                  // if it myNumber == guess number return right page
                  // else return wrong page
                },
                child: const Text("Submit"))
          ],
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
