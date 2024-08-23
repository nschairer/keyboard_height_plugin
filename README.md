# Keyboard Height Plugin for Flutter

`keyboard_height_plugin` is a Flutter plugin for iOS and Android that provides the keyboard size before the keyboard animation occurs for showing or hiding it. This helps eliminate lag when positioning widgets around the keyboard, such as placing a TextField above the keyboard.

## Installation

To install `keyboard_height_plugin`, add it to your `pubspec.yaml` file under the `dependencies` section:

```yaml
dependencies:
  keyboard_height_plugin: ^0.1.5
```

## Usage

To use the `keyboard_height_plugin`, first import it in your Dart file:

```dart
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
```

Next, create a stateful widget and declare a variable to store the keyboard height and create an instance of the `KeyboardHeightPlugin`:

```dart
class _HomePageState extends State<HomePage>; {
  double _keyboardHeight = 0;
  StreamSubscription<double>? _keyboardHeightSubscription;
  // ... rest of code ...
}
```

Then, initialize the `KeyboardHeightPlugin` in your `initState` method and listen for changes in the keyboard height:

```dart
  @override
  void initState() {
    super.initState();
    _keyboardHeightSubscription =
        KeyboardHeightPlugin.sharedInstance.keyboardHeight.listen((height) {
        setState(() {
          _keyboardHeight = height;
        });
    });
  }

  @override
  void dispose() {
    _keyboardHeightSubscription?.cancel();
    super.dispose();
  }
```

Use the `_keyboardHeight` variable to position your widgets around the keyboard. 

## Example

For a complete example on how to use the `keyboard_height_plugin`, please refer to the [`example`](example) directory in the repository.

## Contributing

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on the project's GitHub repository.

## License

This plugin is licensed under the [BSD 3-Clause License](LICENSE).
