import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      // Thay đổi màu nền ngẫu nhiên
      _backgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Thay đổi màu nền'),
        ),
        body: Container(
          color: _backgroundColor,
          child: Center(
            child: ElevatedButton(
              onPressed: _changeBackgroundColor,
              child: Text('Thay đổi màu'),
            ),
          ),
        ),
      ),
    );
  }
}
