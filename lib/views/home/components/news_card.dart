import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';

class NewsCard extends StatelessWidget {
  NewsCard(
      {Key? key, required this.image, required this.topic, required this.time})
      : super(key: key);
  final String image;
  final String time;
  final String topic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width / 9 * 10,
          clipBehavior: Clip.hardEdge,
          height: 270,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.4),
              ),
              width: MediaQuery.of(context).size.width / 9 * 10,
              clipBehavior: Clip.hardEdge,
            )),
        Positioned(
            top: 10,
            left: 25,
            right: 25,
            // bottom: 1,
            child: Row(
              children: [
                AppText.captionMedium(time, color: Colors.white),
                const Spacer(),
                const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                )
              ],
            )),
        Positioned(
            left: 25,
            right: 25,
            bottom: 10,
            child: AppText.headingMeduim(
              topic,
              height: 1,
            ))
      ],
    );
  }
}
