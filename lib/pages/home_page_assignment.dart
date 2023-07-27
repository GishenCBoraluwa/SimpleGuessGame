import 'package:flutter/material.dart';
import 'package:gussgame/pages/game_over_page.dart.dart';
import 'dart:math';
import 'package:gussgame/pages/right_guess.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  int secretNumber = Random().nextInt(10) + 1;
  int chancesLeft = 3;
  TextEditingController _textEditingController = TextEditingController();
  String message = '';

  void checkGuess() {
    int guessedNumber = int.tryParse(_textEditingController.text) ?? 0;

    if (guessedNumber == secretNumber) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GuessRightPage(guessedNumber)),
      );
    } else {
      chancesLeft--;
      if (chancesLeft == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameOverPage(secretNumber)),
        );
      } else {
        // setState(() {
        //   message = 'Wrong guess. You have $chancesLeft chances left.';
        // });
      }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess the Number"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "I have a secret number in my mind (1 - 10). You have $chancesLeft chances to guess it.",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  checkGuess();
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
