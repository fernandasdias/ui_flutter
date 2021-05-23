import 'dart:math';

import 'package:flutter/material.dart';

import '../curve_painter.dart';
import '../styles.dart';

class Shape2 extends StatelessWidget {
  const Shape2({
    Key? key,
    required this.totalWidth,
    required this.totalHeight,
    required this.top,
    required this.left,
    required this.angle,
    required this.height,
    required this.color,
  }) : super(key: key);

  final double totalWidth;
  final double totalHeight;
  final double top;
  final double left;
  final double angle;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          height: height,
          child: CustomPaint(
            size: Size(totalWidth, totalHeight),
            painter: CurvePainter2(color: color),
          ),
        ),
      ),
    );
  }
}

class Shape1 extends StatelessWidget {
  const Shape1({
    Key? key,
    required this.totalWidth,
    required this.totalHeight,
  }) : super(key: key);

  final double totalWidth;
  final double totalHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Transform.rotate(
        angle: pi / 10,
        child: Container(
          height: 300,
          // color: Colors.black12,
          child: CustomPaint(
            size: Size(totalWidth, totalHeight),
            painter: CurvePainter2(color: Styles.wave3),
          ),
        ),
      ),
    );
  }
}
