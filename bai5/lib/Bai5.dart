import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberCheckerApp());
}

class PrimeNumberCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prime Number Checker'),
        ),
        body: PrimeNumberCheckerScreen(),
      ),
    );
  }
}

class PrimeNumberCheckerScreen extends StatefulWidget {
  @override
  _PrimeNumberCheckerScreenState createState() => _PrimeNumberCheckerScreenState();
}

class _PrimeNumberCheckerScreenState extends State<PrimeNumberCheckerScreen> {
  int number = 0;
  bool isPrime = false;

  void checkPrime() {
    if (number < 2) {
      setState(() {
        isPrime = false;
      });
      return;
    }

    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        setState(() {
          isPrime = false;
        });
        return;
      }
    }

    setState(() {
      isPrime = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter a number'),
            onChanged: (value) {
              setState(() {
                number = int.tryParse(value) ?? 0;
                isPrime = false;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              checkPrime();
            },
            child: Text('Check Prime'),
          ),
          SizedBox(height: 20),
          Text(
            isPrime ? '$number là số nguyên tố .' : '$number không là số nguyên tố .',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}