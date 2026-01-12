# Keyboard Height Plugin for Flutter

`keyboard_height_plugin` is a Flutter plugin for iOS and Android that provides the keyboard size before the keyboard animation occurs for showing or hiding it. This helps eliminate lag when positioning widgets around the keyboard, such as placing a TextField above the keyboard.

## Requirements

### Version 0.2.0+ (Current)
- **Android:**
  - Android Gradle Plugin (AGP) 8.6.0+
  - Gradle 8.7+
  - Kotlin 2.1.0+
  - Java 17+
  - minSdkVersion 16 (Android 4.1+)
  - compileSdkVersion 34+
- **iOS:**
  - iOS 9.0+
  - Includes Privacy Manifest for App Store compliance

### Version 0.1.5 (Legacy Support)
For projects that cannot upgrade to the modern build tools, use version 0.1.5:
- Android Gradle Plugin 7.x
- Kotlin 1.7.x
- Java 11+

## Installation

To install `keyboard_height_plugin`, add it to your `pubspec.yaml` file under the `dependencies` section:

```yaml
dependencies:
  keyboard_height_plugin: ^0.2.0
```

**For legacy projects:**
```yaml
dependencies:
  keyboard_height_plugin: 0.1.5
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
  final KeyboardHeightPlugin _keyboardHeightPlugin = KeyboardHeightPlugin();
  // ... rest of code ...
}
```

Then, initialize the `KeyboardHeightPlugin` in your `initState` method and listen for changes in the keyboard height:

```dart
@override
void initState() {
  super.initState();
  _keyboardHeightPlugin.onKeyboardHeightChanged((double height) {
    setState(() {
      _keyboardHeight = height;
    });
  });
}
```

Use the `_keyboardHeight` variable to position your widgets around the keyboard. 

## Example

For a complete example on how to use the `keyboard_height_plugin`, please refer to the [`example`](example) directory in the repository.

## Contributing

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on the project's GitHub repository.

## License

This plugin is licensed under the [BSD 3-Clause License](LICENSE).
