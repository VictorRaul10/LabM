// first_page.dart
import 'package:flutter/material.dart';
import 'package:laboratorio09/app/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecondPage()));
          },
          child: const Text('Go to Second Page'),
        ),
      ),
    );
  }
}
