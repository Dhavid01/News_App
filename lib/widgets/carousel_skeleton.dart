// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:news/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class CarouselSkeleton extends StatelessWidget {
  const CarouselSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kSkelenton,
                ),
              ),
              const Positioned(
                  top: 20,
                  left: 15,
                  child: Skeleton(
                    height: 10,
                    width: 100,
                  )),
              const Positioned(
                  top: 20,
                  right: 15,
                  child: Skeleton(
                    height: 10,
                    width: 50,
                  )),
              const Positioned(
                bottom: 60,
                left: 15,
                child: Skeleton(
                  height: 10,
                  width: 200,
                ),
              ),
              const Positioned(
                bottom: 40,
                left: 15,
                child: Skeleton(
                  height: 10,
                  width: 150,
                ),
              ),
              const Positioned(
                bottom: 20,
                left: 15,
                child: Skeleton(
                  height: 10,
                  width: 104,
                ),
              )
            ],
          ),
        ),
        baseColor: Colors.grey.withOpacity(0.6),
        highlightColor: kSkelenton);
  }
}
