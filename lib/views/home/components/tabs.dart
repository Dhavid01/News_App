import 'package:flutter/material.dart';
import 'package:news/utils/text.dart';

// ignore: must_be_immutable
class Tabs extends StatelessWidget {
  Tabs({Key? key, required this.color, required this.text}) : super(key: key);
  late String text;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: Center(
            child: AppText.caption(
          text,
          color: Colors.black,
        )),
      ),
    );
  }
}
