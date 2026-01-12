// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:keyboard_height_plugin_example/main.dart';

void main() {
  testWidgets('Verify keyboard height display', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that keyboard height text is displayed.
    expect(
      find.text('Keyboard height: 0.0'),
      findsOneWidget,
    );

    // Verify that the button is present.
    expect(
      find.text('Get Keyboard Height'),
      findsOneWidget,
    );
  });
}
