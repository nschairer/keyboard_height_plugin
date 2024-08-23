import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class KeyboardHeightPlugin {
  static const sharedInstance = KeyboardHeightPlugin._();

  const KeyboardHeightPlugin._();

  Stream<double> get keyboardHeight {
    if (Platform.isIOS || Platform.isAndroid) {
      const keyboardHeightEventChannel =
          EventChannel('keyboardHeightEventChannel');
      return keyboardHeightEventChannel
          .receiveBroadcastStream()
          .map((dynamic height) => height as double);
    } else {
      // For all non-implemented platforms, we return a
      // Stream that indicates a closed keyboard
      return Stream.value(0);
    }
  }
}
