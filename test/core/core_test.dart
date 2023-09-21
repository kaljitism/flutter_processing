import 'package:flutter_processing/flutter_processing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_infra.dart';

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
          widgetTester, "core_setup-paints-default-background");
    });
  });
}
