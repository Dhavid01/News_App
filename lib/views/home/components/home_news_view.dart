import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/core/constants/apiKeys.dart';
import 'package:news/utils/all_functions.dart';
import 'package:news/utils/color.dart';
import 'package:news/views/home/components/news_card.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/constants/imageKeys.dart';

class HomeNewsView extends StatefulWidget {
  const HomeNewsView({Key? key}) : super(key: key);

  @override
  State<HomeNewsView> createState() => _HomeNewsViewState();
}

final AllFunction _allFunction = AllFunction();

class _HomeNewsViewState extends State<HomeNewsView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () => getNews());
    super.initState();
  }

  getNews() async {
    await _allFunction.getTrendingAndLatest("trending", 5);
    setState(() {
      _allFunction.trendingList;
    });
    print(_allFunction.trendingList);
  }

  // This is the starting index of carousel images in a list
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (index, _) => upDateIndicator(index),
              initialPage: 0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.84,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 900)),
          items: _allFunction.trendingList.map((e) {
            /// A custom widget that shows the news topic,image and published time
            return NewsCard(
                image: e[ApiKeys.image] == ApiKeys.emptyString
                    ? ImageKeys.noImage
                    : e[ApiKeys.image] ?? ImageKeys.noImage,
                topic: e[ApiKeys.title],
                time: timeago.format(DateTime.parse(e[ApiKeys.time])));
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            _allFunction.trendingList.length,
            (index) => AnimatedContainer(
              height: 7,
              width: carouselIndex == index ? 20 : 10,
              margin: const EdgeInsets.all(3.0),
              duration: const Duration(milliseconds: 800),
              decoration: BoxDecoration(
                color: carouselIndex == index ? kPrimaryColor : kSkelenton,
                border: Border.all(color: kPrimaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        )
      ],
    );
  }

  // A method to help us update carousel images
  upDateIndicator(int index) {
    setState(() {
      carouselIndex = index;
    });
  }
}
