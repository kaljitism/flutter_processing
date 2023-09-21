import 'package:flutter/material.dart';

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
      .._doSetup()
      ..draw();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Sketch {
  Canvas? canvas;
  Size? size;

  final void Function(Sketch)? _setup;
  final void Function(Sketch)? _draw;

  Sketch.simple({
    void Function(Sketch)? setup,
    void Function(Sketch)? draw,
  })  : _setup = setup,
        _draw = draw;

  void _doSetup() {
    background(color: const Color(0xffc5c5c5));
    setup();
  }

  void setup() {
    _setup?.call(this);
  }

  void draw() {
    _draw?.call(this);
  }

  void background({
    required Color color,
  }) {
    final paint = Paint()..color = color;
    canvas?.drawRect(Offset.zero & size!, paint);
  }

  void circle({
    required Offset center,
    required double diameter,
  }) {
    final paint = Paint()..color = Colors.white;
    canvas?.drawCircle(center, diameter / 2, paint);
  }
}
