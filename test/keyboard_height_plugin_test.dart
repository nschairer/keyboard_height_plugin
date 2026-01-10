import 'package:flutter_test/flutter_test.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  test('KeyboardHeightPlugin can be instantiated', () {
    final plugin = KeyboardHeightPlugin();
    expect(plugin, isNotNull);
  });
}
