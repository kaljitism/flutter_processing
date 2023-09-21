import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void configureWindowForSpecTest(WidgetTester widgetTester) {
  widgetTester.view
    ..physicalSize = const Size(100, 100)
    ..devicePixelRatio = 1.0;
}
