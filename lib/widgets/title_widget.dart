import 'package:flutter/material.dart';

import '../styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.totalWidth,
  }) : super(key: key);

  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
      // color: Colors.amberAccent,
      // width: totalWidth * 0.5,
      child: Text(
        'Flowers \nSchool',
        style: Styles.title,
      ),
    );
  }
}
