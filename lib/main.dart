import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plants_app/styles.dart';
import 'package:plants_app/widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    var totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Stack(children: [
          // Container(
          //   height: 200,
          //   // color: Colors.black12,
          //   child: CustomPaint(
          //     size: Size(totalWidth, totalHeight),
          //     painter: CurvePainter(color: Styles.wave2),
          //   ),
          // ),
          Shape1(totalWidth: totalWidth, totalHeight: totalHeight),
          Shape2(
            totalWidth: totalWidth,
            totalHeight: totalHeight,
            top: 200,
            left: 300,
            angle: pi / 10,
            height: 300,
            color: Styles.wave2,
          ),
          // Shape2(
          //   totalWidth: totalWidth,
          //   totalHeight: totalHeight,
          //   top: 450,
          //   left: 400,
          //   angle: pi / 9,
          //   height: 200,
          //   color: Styles.wave3,
          // ),
          Shape2(
            totalWidth: totalWidth,
            totalHeight: totalHeight,
            top: 300,
            left: totalWidth * 0.1,
            angle: pi / 10,
            height: 200,
            color: Styles.wave1,
          ),

          Container(
            height: totalHeight * 0.45,
            width: totalWidth,
            decoration: BoxDecoration(
              // backgroundBlendMode: BlendMode.colorDodge,
              // gradient: LinearGradient(
              //   colors: [Color(0xFF446D71), Colors.white12],
              //   transform: GradientRotation(40),
              // ),
              color: Styles.wave3,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuWidget(),
                TitleWidget(totalWidth: totalWidth),
                SearchFieldWidget(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

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

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.black26),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    ));
  }
}

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
