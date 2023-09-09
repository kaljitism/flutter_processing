import 'package:flutter/widgets.dart';

class Processing extends StatelessWidget {
  const Processing({
    super.key,
    required this.sketch,
  });

  final Sketch sketch;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _SketchPainter(sketch: sketch),
    );
  }
}

class _SketchPainter extends CustomPainter {
  final Sketch sketch;

  _SketchPainter({super.repaint, required this.sketch});

  @override
  void paint(Canvas canvas, Size size) {
    sketch
      ..canvas = canvas
      ..size = size
      ..setup()
      ..draw();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

abstract class Sketch {
  void setup() {}

  void draw() {}

  Canvas? canvas;
  Size? size;

  void background({
    required Color color,
  }) {
    final paint = Paint()..color = color;
    canvas?.drawRect(Offset.zero & size!, paint);
  }
}
