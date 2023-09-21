import 'package:flutter_processing/flutter_processing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_infra.dart';

void main() {
  group('shape', () {
    group('2D Primitives', () {
      testGoldens("circle(): example 1", (widgetTester) async {
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

        await screenMatchesGolden(
            widgetTester, "shape_2-d-primitives_circle-example-1");
      });
    });
  });
}
