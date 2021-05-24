import 'package:flutter/material.dart';

import '../styles.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SearchFieldWidgetState createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    bool closeBtn = true;
    return (Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white24.withAlpha(40),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        onChanged: (value) {
          if (value.isNotEmpty && closeBtn == true) {
            // setState(() {
            //   print('first');
            //   closeBtn = false;
            // });
          }
          if (value.isEmpty && closeBtn == false) {
            // print('second');
            // setState(() {
            //   closeBtn = true;
            // });
          }
        },
        style: Styles.textFieldStyle,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: Styles.textFieldStyle,
          suffixIcon: closeBtn
              ? InkWell(
                  onTap: () => controller.clear(),
                  child: Icon(
                    Icons.close,
                    color: Colors.white24,
                  ),
                )
              : null,
        ),
      ),
    ));
  }
}
