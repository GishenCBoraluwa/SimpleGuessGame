import 'package:flutter/material.dart';

class GuessRightPage extends StatelessWidget {
  final int guessedNumber;

  const GuessRightPage(this.guessedNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Right'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Yes! You guessed the number right.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'My number is $guessedNumber',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Start Again'),
            ),
          ],
        ),
      ),
    );
  }
}
