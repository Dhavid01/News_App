import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';

class HeadlineCard extends StatelessWidget {
  const HeadlineCard({
    Key? key,
    required this.title,
    required this.topic,
    required this.image,
    required this.time,
    required this.rights,
    required this.body,
    required this.handle,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String topic;
  final String image;
  final String time;
  final String rights;
  final String body;
  final String handle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor.withOpacity(0.5),
          ),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 90,
                width: 80,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: image,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width - 185,
                    child: AppText.headingMeduim(
                      title,
                      height: 1.1,
                      overflow: TextOverflow.ellipsis,
                      multitext: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.captionMedium(time),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.bookmark_add_outlined),
                color: kSecondaryColor,
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
