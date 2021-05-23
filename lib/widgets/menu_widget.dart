import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getItem(30),
        getItem(20),
      ],
    );
  }

  Container getItem(double width) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      width: width,
      height: 4.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(15),
          right: Radius.circular(15),
        ),
      ),
    );
  }
}
