import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:slider_view/slider_view.dart';

const int _kCode = 65;

void main() {
  testWidgets('Infinity scrolling', (WidgetTester tester) async {
    const width = 200.0;
    const length = 16;
    const duration = Duration(milliseconds: 800);
    final log = <int>[];

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: SliderView(
        config: SliderViewConfig<String>(
          autoScroll: false,
          width: width,
          height: width,
          models: List.generate(
              length, (int index) => String.fromCharCode(_kCode + index)),
          itemBuilder: (String text) => SizedBox(child: Text(text)),
          onPageIndexChanged: (index) {
            log.add(index);
          },
        ),
      ),
    ));

    expect(find.text(String.fromCharCode(_kCode)), findsOneWidget);

    // From left to right.
    for (int i = 0; i < length - 1; i++) {
      await tester.timedDrag(
          find.byType(Directionality), const Offset(-width, 0.0), duration);
      await tester.pumpAndSettle();
      expect(find.text(String.fromCharCode(_kCode + i)), findsNothing);
      expect(find.text(String.fromCharCode(_kCode + i + 1)), findsOneWidget);
      expect(log, [i + 1]);
      log.clear();
    }

    // To the first item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode)), findsOneWidget);
    expect(log, [0]);
    log.clear();

    // To the last item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsOneWidget);
    expect(log, [length - 1]);
    log.clear();

    // To the first item again.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode)), findsOneWidget);
    expect(log, [0]);
    log.clear();

    // To the second item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + 1)), findsOneWidget);
    expect(log, [1]);
    log.clear();

    // To the third item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + 1)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + 2)), findsOneWidget);
    expect(log, [2]);
    log.clear();

    // Back to the second item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + 2)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + 1)), findsOneWidget);
    expect(log, [1]);
    log.clear();

    // Back to the first item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + 1)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode)), findsOneWidget);
    expect(log, [0]);
    log.clear();

    // Back to the last item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsOneWidget);
    expect(log, [length - 1]);
    log.clear();

    // From right to left.
    for (int i = length - 1; i > 0; i--) {
      await tester.timedDrag(
          find.byType(Directionality), const Offset(width, 0.0), duration);
      await tester.pumpAndSettle();
      expect(find.text(String.fromCharCode(_kCode + i)), findsNothing);
      expect(find.text(String.fromCharCode(_kCode + i - 1)), findsOneWidget);
      expect(log, [i - 1]);
      log.clear();
    }

    // To the last item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsOneWidget);
    expect(log, [length - 1]);
    log.clear();

    // To the first item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode)), findsOneWidget);
    expect(log, [0]);
    log.clear();

    // To the last item again.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsOneWidget);
    expect(log, [length - 1]);
    log.clear();

    // To the second term from bottom.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 2)), findsOneWidget);
    expect(log, [length - 2]);
    log.clear();

    // To the third term from bottom.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 2)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 3)), findsOneWidget);
    expect(log, [length - 3]);
    log.clear();

    // Back to the second term from bottom.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 3)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 2)), findsOneWidget);
    expect(log, [length - 2]);
    log.clear();

    // Back to the last item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 2)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsOneWidget);
    expect(log, [length - 1]);
    log.clear();

    // Back to the first item.
    await tester.timedDrag(
        find.byType(Directionality), const Offset(-width, 0.0), duration);
    await tester.pumpAndSettle();
    expect(find.text(String.fromCharCode(_kCode + length - 1)), findsNothing);
    expect(find.text(String.fromCharCode(_kCode)), findsOneWidget);
    expect(log, [0]);
  });

  testWidgets('Auto scrolling', (WidgetTester tester) async {
    const length = 11;
    final log = <int>[];

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: SliderView(
        config: SliderViewConfig<String>(
          scrollInterval: const Duration(seconds: 1),
          width: 200,
          height: 200,
          models: List.generate(
              length, (int index) => String.fromCharCode(65 + index)),
          itemBuilder: (String text) => SizedBox(child: Text(text)),
          onPageIndexChanged: (index) {
            log.add(index);
          },
        ),
      ),
    ));

    expect(find.text(String.fromCharCode(_kCode)), findsOneWidget);

    for (int i = 1; i <= length * 3; i++) {
      final index = i % length;
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle(const Duration(milliseconds: 200));
      expect(find.text(String.fromCharCode(_kCode + index - 1)), findsNothing);
      expect(find.text(String.fromCharCode(_kCode + index)), findsOneWidget);
      expect(log, [index]);
      log.clear();
    }
  });
}
