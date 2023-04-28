import 'package:flutter_test/flutter_test.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin_platform_interface.dart';
import 'package:keyboard_height_plugin/keyboard_height_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKeyboardHeightPluginPlatform
    with MockPlatformInterfaceMixin
    implements KeyboardHeightPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KeyboardHeightPluginPlatform initialPlatform = KeyboardHeightPluginPlatform.instance;

  test('$MethodChannelKeyboardHeightPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKeyboardHeightPlugin>());
  });

  test('getPlatformVersion', () async {
    KeyboardHeightPlugin keyboardHeightPlugin = KeyboardHeightPlugin();
    MockKeyboardHeightPluginPlatform fakePlatform = MockKeyboardHeightPluginPlatform();
    KeyboardHeightPluginPlatform.instance = fakePlatform;

    expect(await keyboardHeightPlugin.getPlatformVersion(), '42');
  });
}
