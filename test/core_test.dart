import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('core', () {
    testGoldens("User can paint through processing Widget",
        (widgetTester) async {
      widgetTester.view
        ..physicalSize = const Size(100, 100)
        ..devicePixelRatio = 1.0;

      await widgetTester.pumpWidget(
        Processing(
          sketch: MyTestSketch(),
        ),
      );

      await screenMatchesGolden(widgetTester, "core_draw_background");
    });

    testGoldens("User can paint through processing Widget",
        (widgetTester) async {
      widgetTester.view
        ..physicalSize = const Size(100, 100)
        ..devicePixelRatio = 1.0;

      await widgetTester.pumpWidget(
        Processing(
          sketch: MyTestSketch(),
        ),
      );

      await screenMatchesGolden(widgetTester, "core_draw_background");
    });
  });
}

class MyTestSketch extends Sketch {
  @override
  void draw() {
    background(
      color: const Color(0xffFFF237),
    );
  }
}
