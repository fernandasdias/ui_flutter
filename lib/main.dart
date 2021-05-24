import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/styles.dart';
import 'package:plants_app/widgets/widgets.dart';

import 'curve_painter.dart';

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
          fontFamily: GoogleFonts.raleway().fontFamily),
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
    double cardPosition = totalHeight - totalHeight * 0.59;
    double teste = totalHeight - totalHeight * 0.91;
    print(cardPosition);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          height: totalHeight,
          // color: Colors.amber,
          child: Stack(
            children: [
              // Shape1(totalWidth: totalWidth, totalHeight: totalHeight),
              // Shape2(
              //   totalWidth: totalWidth,
              //   totalHeight: totalHeight,
              //   top: 200,
              //   left: 300,
              //   angle: pi / 10,
              //   height: 300,
              //   color: Styles.wave2,
              // ),
              // Shape2(
              //   totalWidth: totalWidth,
              //   totalHeight: totalHeight,
              //   top: 300,
              //   left: totalWidth * 0.1,
              //   angle: pi / 10,
              //   height: 200,
              //   color: Styles.wave1,
              // ),
              Container(
                  height: totalHeight * 0.45,
                  width: totalWidth,
                  decoration: BoxDecoration(
                    // backgroundBlendMode: BlendMode.colorDodge,
                    // gradient: LinearGradient(
                    //   colors: [Color(0xFF446D71), Colors.white12],
                    //   transform: GradientRotation(40),
                    // ),
                    color: Styles.wave1,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  )),

              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuWidget(),
                    Padding(
                      padding: EdgeInsets.only(top: teste),
                      child: TitleWidget(totalWidth: totalWidth),
                    ),
                    SearchFieldWidget(),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ListView(children: [
                        CardWidget(
                          totalWidth: totalWidth,
                          image: 'assets/plant1.jpg',
                        ),
                        CardWidget(
                          totalWidth: totalWidth,
                          image: 'assets/plant2.jpg',
                        ),
                        CardWidget(
                          totalWidth: totalWidth,
                          image: 'assets/plants3.jpg',
                        ),
                        CardWidget(
                          totalWidth: totalWidth,
                          image: 'assets/plants4.jpg',
                        ),
                      ]),
                    )),
                  ],
                ),
              ),
//Photo by <a href="https://unsplash.com/@yaanapi?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Yanapi Senaud</a> on <a href="https://unsplash.com/s/photos/coffee?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
//Photo by <a href="https://unsplash.com/@nate_dumlao?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Nathan Dumlao</a> on <a href="https://unsplash.com/s/photos/coffee?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
//Photo by <a href="https://unsplash.com/@ohmky2540?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Ohmky</a> on <a href="https://unsplash.com/s/photos/coffee?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
//Photo by <a href="https://unsplash.com/@mjsleeper?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Matthew Sleeper</a> on <a href="https://unsplash.com/s/photos/coffee?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>

              // Container(
              //   padding: EdgeInsets.only(top: cardPosition, left: 20),
              //   height: totalHeight,
              //   // color: Colors.amber,
              //   child: ListView(
              //     children: [CardWidget(totalWidth: totalWidth)],
              //   ),
              // ),

              // Positioned(
              //   top: totalHeight - totalHeight * 0.6,
              //   child: Container(
              //     // height: totalHeight,
              //     margin: EdgeInsets.fromLTRB(12, 10, 0, 0),
              //     child: SingleChildScrollView(
              //       child: Column(
              //         children: [
              //           CardWidget(
              //             totalWidth: totalWidth,
              //           ),
              //           CardWidget(
              //             totalWidth: totalWidth,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.totalWidth,
    required this.image,
  }) : super(key: key);
  final double totalWidth;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: totalWidth,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerRight,
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          // image: DecorationImage(image: FileImage(File(image))),
          color: Styles.cardBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-1, 1),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(30))),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black26.withOpacity(0.3),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 16, left: 20),
                    child: SvgPicture.asset(
                      'assets/heart.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 28),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Monstera',
                      style: Styles.cardTitleStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 15, bottom: 15, right: 0),
                    alignment: Alignment.centerLeft,
                    // width: 60,
                    // decoration:
                    //     BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(Icons)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://avatars.githubusercontent.com/u/22924345?v=4',
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'by Fernanda D. ',
                            style: Styles.cardTextAuthorStyle,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              // color: Colors.amber,
              // child: Text('fernanda'),
            ),
          ),
        ],
      ),
    );
  }
}
