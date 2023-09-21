import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('core', () {
    testGoldens("User can paint background in setup()", (widgetTester) async {
      widgetTester.view
        ..physicalSize = const Size(100, 100)
        ..devicePixelRatio = 1.0;

      await widgetTester.pumpWidget(
        Processing(
          sketch: Sketch.simple(
              setup: (s) {
                s.background(color: const Color(0xff404040));
              },
              draw: (s) {}),
        ),
      );

      await screenMatchesGolden(widgetTester, "core_background_setup");
    });

    testGoldens("User can paint background in draw()", (widgetTester) async {
      widgetTester.view
        ..physicalSize = const Size(100, 100)
        ..devicePixelRatio = 1.0;

      await widgetTester.pumpWidget(
        Processing(
          sketch: Sketch.simple(
            setup: (s) {},
            draw: (s) => s.background(color: const Color(0xff000000)),
          ),
        ),
      );

      await screenMatchesGolden(widgetTester, "core_background_draw");
    });

    testGoldens("User can paint background in orange", (widgetTester) async {
      widgetTester.view
        ..physicalSize = const Size(100, 100)
        ..devicePixelRatio = 1.0;

      await widgetTester.pumpWidget(
        Processing(
          sketch: Sketch.simple(
            setup: (s) {},
            draw: (s) => s.background(color: const Color(0xffFFCC00)),
          ),
        ),
      );

      await screenMatchesGolden(widgetTester, "core_background_orange");
    });

    testGoldens("background in draw() replaces background in setup()",
        (widgetTester) async {
      widgetTester.view
        ..physicalSize = const Size(100, 100)
        ..devicePixelRatio = 1.0;

      await widgetTester.pumpWidget(
        Processing(
          sketch: Sketch.simple(
            setup: (s) => s.background(color: const Color(0xffffcc00)),
            draw: (s) => s.background(color: const Color(0xff000000)),
          ),
        ),
      );

      await screenMatchesGolden(widgetTester, "core_background_setup_draw");
    });
  });
}
