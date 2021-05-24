import 'package:flutter/material.dart';

import '../styles.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return (Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white24.withAlpha(40),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        style: Styles.textFieldStyle,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: Styles.textFieldStyle,
          suffixIcon: InkWell(
            onTap: () => controller.clear(),
            child: Icon(
              Icons.close,
              color: Colors.white24,
            ),
          ),
        ),
      ),
    ));
  }
}
