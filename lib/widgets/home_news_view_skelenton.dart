import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class HomeNewsViewSkelenton extends StatelessWidget {
  const HomeNewsViewSkelenton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kTabColor.withOpacity(0.5),
      highlightColor: kSkelenton,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: kSkelenton),
            width: MediaQuery.of(context).size.width / 9 * 10,
            clipBehavior: Clip.hardEdge,
            height: 270,
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kSkelenton,
                ),
                width: MediaQuery.of(context).size.width / 9 * 10,
                clipBehavior: Clip.hardEdge,
              )),
        ],
      ),
    );
  }
}
