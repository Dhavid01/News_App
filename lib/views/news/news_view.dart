import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';
import 'package:news/views/news/components/news_image_card.dart';
import 'package:news/widgets/webview.dart';

class NewsView extends StatelessWidget {
  const NewsView(
      {Key? key,
      required this.image,
      required this.author,
      required this.time,
      required this.title,
      required this.url,
      required this.body})
      : super(key: key);
  final String image;
  final String author;
  final String time;
  final String title;
  final String body;
  final String url;

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
                      height: 80,
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
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      height: MediaQuery.of(context).size.height * (0.2 / 3),
                      width: MediaQuery.of(context).size.width * (1.7 / 3),
                      decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExploreWebView(
                                        url: url,
                                      )));
                        },
                        child: Center(
                          child: AppText.heading(
                            "Read More ...",
                          ),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
