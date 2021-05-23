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
        minimum: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Stack(children: [
          Container(
            height: 200,
            // color: Colors.black12,
            child: CustomPaint(
              size: Size(totalWidth, totalHeight),
              painter: CurvePainter(color: Styles.wave2),
            ),
          ),
          Container(
            height: totalHeight * 0.45,
            width: totalWidth,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.657,
        size.width * 0.5, size.height * 0.6757);
    path.quadraticBezierTo(size.width * 0.73, size.height * 0.03,
        size.width * 1, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);

    // canvas.drawCircle;(center, 100, paint);
  }
  // void paint(Canvas canvas, Size size) {
  //   var paint = Paint();
  //   paint.color = Colors.red;
  //   paint.style = PaintingStyle.fill;

  //   var path = Path();

  //   // path.moveTo(0, size.height * 0.8);
  //   // path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
  //   //     size.width * 0.5, size.height * 0.4);
  //   // path.quadraticBezierTo(size.width * 0.75, size.height * 0.45,
  //   //     size.width * 1.0, size.height * 0.9167);
  //   // path.lineTo(size.width, size.height);
  //   // path.lineTo(0, size.height);

  //   canvas.drawPath(path, paint);
  // }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
