import 'package:flutter/material.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _keyboardHeight = 0;
  final KeyboardHeightPlugin _keyboardHeightPlugin = KeyboardHeightPlugin();

  @override
  void initState() {
    super.initState();
    _keyboardHeightPlugin.onKeyboardHeightChanged((double height) {
      setState(() {
        _keyboardHeight = height;
      });
    });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Keyboard Height'),
        ),
        body: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Keyboard height: $_keyboardHeight',
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Get Keyboard Height'),
                      onPressed: () => {},
                    ),
                  ],
                ),
                Positioned(
                  bottom: _keyboardHeight,
                  left: 0,
                  right: 0,
                  child: TextField(
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.orange,
                      hintText: 'Type here to open keyboard',
                    ),
                  ),
                ),
              ],
          ),
        ),
      );
    }
}
