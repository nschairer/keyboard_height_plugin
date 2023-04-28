import 'dart:async';
import 'package:flutter/services.dart';

typedef KeyboardHeightCallback = void Function(double height);

class KeyboardHeightPlugin {
    static const EventChannel _keyboardHeightEventChannel = EventChannel('keyboardHeightEventChannel');

    StreamSubscription? _keyboardHeightSubscription;


    void onKeyboardHeightChanged(KeyboardHeightCallback callback) {
        if (_keyboardHeightSubscription != null) {
            _keyboardHeightSubscription!.cancel();
        }
        _keyboardHeightSubscription = _keyboardHeightEventChannel
        .receiveBroadcastStream()
        .listen((dynamic height) {
            callback(height as double);
        });
    }

    void dispose() {
        if (_keyboardHeightSubscription != null) {
            _keyboardHeightSubscription!.cancel();
        }
    }
}
