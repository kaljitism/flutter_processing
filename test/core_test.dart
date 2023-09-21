import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_infra.dart';

void main() {
  group('core', () {
    testGoldens("setup() paints light gray background by default",
        (widgetTester) async {
      configureWindowForSpecTest(widgetTester);

      await widgetTester.pumpWidget(
        Processing(
          sketch: Sketch.simple(),
        ),
      );

      await screenMatchesGolden(
          widgetTester, "setup_paints_default_background");
    });

    testGoldens("User can paint background in draw()", (widgetTester) async {
      configureWindowForSpecTest(widgetTester);

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
      configureWindowForSpecTest(widgetTester);

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
      configureWindowForSpecTest(widgetTester);

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

    testGoldens("draw a circle()", (widgetTester) async {
      configureWindowForSpecTest(widgetTester);

      await widgetTester.pumpWidget(
        Processing(
          sketch: Sketch.simple(
            draw: (s) => s.circle(
              center: const Offset(56, 46),
              diameter: 55,
            ),
          ),
        ),
      );

      await screenMatchesGolden(widgetTester, "shape_2-d-primitives_circle");
    });
  });
}
