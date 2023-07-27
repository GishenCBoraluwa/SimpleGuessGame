import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  final int secretNumber;

  const GameOverPage(this.secretNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Over'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sorry, game over. My secret number is $secretNumber',
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
