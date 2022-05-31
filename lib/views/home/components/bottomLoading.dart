import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';

class BottomLoading extends StatelessWidget {
  const BottomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 20,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
