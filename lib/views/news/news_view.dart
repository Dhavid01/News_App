import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';
import 'package:news/views/news/components/news_image_card.dart';

class NewsView extends StatelessWidget {
  const NewsView(
      {Key? key,
      required this.image,
      required this.author,
      required this.time,
      required this.title,
      required this.body})
      : super(key: key);
  final String image;
  final String author;
  final String time;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsImageCard(author: author, image: image, time: time),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Container(
                      width: 5,
                      height: 60,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: AppText.heading(
                        title,
                        color: Colors.black,
                        height: 1,
                        multitext: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppText.caption(
                  body,
                  centered: false,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
