import 'package:flutter/material.dart';
import 'package:gussgame/pages/game_over_page.dart.dart';
import 'dart:math';
import 'package:gussgame/pages/right_guess.dart';
import 'package:gussgame/pages/wrong_guess.dart';

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

  int secretNumber = 0;
  int chancesLeft = 3;
  TextEditingController _textEditingController = TextEditingController();
  String message = '';

  void startNewGame() {
    setState(() {
      secretNumber = Random().nextInt(10) + 1;
      chancesLeft = 3;
      message = '';
    });
  }

  void checkGuess() {
    int guessedNumber = int.tryParse(_textEditingController.text) ?? 0;

    if (guessedNumber == secretNumber) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GuessRightPage(guessedNumber)),
      );
      startNewGame();

    } else {
      chancesLeft--;
      if (chancesLeft == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameOverPage(secretNumber)),
        );
        startNewGame();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WrongGuessPage()),
        );       
      }

      setState(() {
          message = ' $chancesLeft of 3 chances left.';
         });
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guess the Number")),
      body: Center(
        child: Padding(

          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Image.asset("assets/sh.png", height: 200, width: 150,),
              const Text(
                "I have a secret number in my mind (1 - 10). You have 3 chances to guess it. Can you guess it?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                message = ' $chancesLeft of 3 chances left.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                maxLength: 2,
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
              
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    int randomNumber = Random(10).nextInt(10) + 1;
    secretNumber = randomNumber;
    super.initState();
  }
}
