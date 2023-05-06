// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_blog/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_blog/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  testWidgets("test the login page", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("Welcome"), findsOneWidget);
    expect(find.text("gvrzegezges"), findsNothing);
  });

  testWidgets("test the home page", (WidgetTester tester) async {
    // Build the widget tree.
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify that the initial background color is white.
    expect(tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
        equals(Colors.white));

    // Tap the color lens icon to change the background color.
    await tester.tap(find.byIcon(Icons.color_lens));
    await tester.pump();

    // Verify that the background color has changed to redAccent.
    expect(tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
        equals(Colors.redAccent));
  });
}
