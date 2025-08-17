import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_window_size/material_window_size.dart';

void main() {
  const Key key = Key('test');
  group('WindowSizeClass', () {
    Widget buildWidget(Size size) {
      return MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: size),
          child: Builder(
            key: key,
            builder: (context) {
              final windowSize = WindowSizeClass.of(context);
              return Text(
                'Width: ${windowSize.width.name}, Height: ${windowSize.height.name}',
              );
            },
          ),
        ),
      );
    }

    testWidgets('Compact width', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget(const Size(300, 200)));
      final windowSize = WindowSizeClass.of(tester.element(find.byKey(key)));
      expect(windowSize.width, WindowWidthClass.compact);
      expect(windowSize.height, WindowHeightClass.compact);
    });

    testWidgets('Medium width', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget(const Size(700, 500)));
      final windowSize = WindowSizeClass.of(tester.element(find.byKey(key)));
      expect(windowSize.width, WindowWidthClass.medium);
      expect(windowSize.height, WindowHeightClass.medium);
    });

    testWidgets('Expanded width', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget(const Size(1000, 1000)));
      final windowSize = WindowSizeClass.of(tester.element(find.byKey(key)));
      expect(windowSize.width, WindowWidthClass.expanded);
      expect(windowSize.height, WindowHeightClass.expanded);
    });

    testWidgets('Large width', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget(const Size(1400, 1000)));
      final windowSize = WindowSizeClass.of(tester.element(find.byKey(key)));
      expect(windowSize.width, WindowWidthClass.large);
      expect(windowSize.height, WindowHeightClass.expanded);
    });

    testWidgets('Extra Large width', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget(const Size(1920, 1080)));
      final windowSize = WindowSizeClass.of(tester.element(find.byKey(key)));
      expect(windowSize.width, WindowWidthClass.extraLarge);
      expect(windowSize.height, WindowHeightClass.expanded);
    });
  });
}
