import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final Color color;

  CurvePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    var path = Path();

    path.moveTo(0, size.height * 0.9123);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.607,
        size.width * 0.5, size.height * 0.7757);
    path.quadraticBezierTo(size.width * 0.735, size.height * 0.0,
        size.width * 1, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter2 extends CustomPainter {
  final Color color;

  CurvePainter2({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.butt;

    Offset center = Offset(size.width / 2, size.height / 2);
    var path = Path();

    path.moveTo(size.width * 0.5, size.height * 0.5);
    // path.quadraticBezierTo(
    //     size.width * 0.5, size.height * 0.5, size.width * 1, size.height * 0.6);
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(0, 0), width: size.width, height: size.height),
        Radius.circular(10)));
    // path.quadraticBezierTo(size.width * 0.735, size.height * 0.0,
    // size.width * 1, size.height * 0.7);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
