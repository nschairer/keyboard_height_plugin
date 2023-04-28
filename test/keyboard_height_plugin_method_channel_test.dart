import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin_method_channel.dart';

void main() {
  MethodChannelKeyboardHeightPlugin platform = MethodChannelKeyboardHeightPlugin();
  const MethodChannel channel = MethodChannel('keyboard_height_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
