import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';

void main() {
  runApp(const MyApp());
}

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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _keyboardHeight = 0;

  StreamSubscription<double>? _keyboardHeightSubscription;

  @override
  void initState() {
    super.initState();
    _keyboardHeightSubscription =
        KeyboardHeightPlugin.sharedInstance.keyboardHeight.listen((height) {
      if (context.mounted) {
        setState(() {
          _keyboardHeight = height;
        });
      }
    });
  }

  @override
  void dispose() {
    _keyboardHeightSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Height'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Keyboard height: $_keyboardHeight'),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.orange,
                hintText: 'Type here to open keyboard',
              ),
            )
          ],
        ),
      ),
    );
  }
}
