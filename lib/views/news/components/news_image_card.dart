import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';

class NewsImageCard extends StatelessWidget {
  const NewsImageCard({
    Key? key,
    required this.author,
    required this.image,
    required this.time,
  }) : super(key: key);

  final String image;
  final String time;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (1.3 / 3),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (1.3 / 3),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
            )),
        Positioned(
            top: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 140,
                ),
                const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 26,
                ),
                const Icon(
                  Icons.bookmark_add_outlined,
                  color: Colors.white,
                )
              ],
            )),
        Positioned(
          bottom: 30,
          left: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.headingMeduim(
                "by $author",
                color: Colors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          right: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.headingMeduim(
                time,
                color: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }
}
