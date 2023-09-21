import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_infra.dart';

void main() {
  group('color', () {
    group('settings', () {
      testGoldens("User can paint background in setup()", (widgetTester) async {
        configureWindowForSpecTest(widgetTester);

        await widgetTester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              setup: (s) => s.background(color: const Color(0xff000000)),
              draw: (s) {},
            ),
          ),
        );

        await screenMatchesGolden(
            widgetTester, "color_setting_background-in-setup");
      });
      testGoldens("background(): example 1", (widgetTester) async {
        configureWindowForSpecTest(widgetTester);

        await widgetTester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              setup: (s) {},
              draw: (s) => s.background(color: const Color(0xff000000)),
            ),
          ),
        );

        await screenMatchesGolden(
            widgetTester, "color_setting_background-example-1");
      });
      testGoldens("background(): example 2", (widgetTester) async {
        configureWindowForSpecTest(widgetTester);

        await widgetTester.pumpWidget(
          Processing(
            sketch: Sketch.simple(
              setup: (s) {},
              draw: (s) => s.background(color: const Color(0xffFFCC00)),
            ),
          ),
        );

        await screenMatchesGolden(
            widgetTester, "color_setting_background-example-2");
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

        await screenMatchesGolden(
            widgetTester, "color_setting_background-setup-and-draw");
      });
    });
  });
}
