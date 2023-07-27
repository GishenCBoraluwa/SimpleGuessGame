import 'package:flutter/material.dart';

class WrongGuessPage extends StatelessWidget {
  const WrongGuessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrong Guess'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sorry, wrong guess. Please try again.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
