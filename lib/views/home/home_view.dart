// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/core/constants/imageKeys.dart';
import 'package:news/utils/all_functions.dart';
// import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';
import 'package:news/views/home/components/home_news_view.dart';
import 'package:news/views/home/components/tabs.dart';
import 'package:news/views/news/news_view.dart';
import 'package:news/widgets/headline_skeleton.dart';
import 'package:news/widgets/headline_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'dart:math';
import 'package:timeago/timeago.dart' as timeago;

import '../../core/constants/apiKeys.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

// This is the starting index of carousel images in a list
int carouselIndex = 0;
final AllFunction _allFunction = AllFunction();

class _HomeViewState extends State<HomeView> {
  var selectedIndex = 0;
  int prevSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  List<String> tabsList = [
    "Politics",
    "Business",
    "Sports",
    "Entertainment",
    "Travel",
    "Music",
    "Public",
  ];

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2), () => getNews(tabsList[selectedIndex]));

    super.initState();
  }

  getNews(q) async {
    await _allFunction.getNews(q);
    setState(() {
      _allFunction.newsList;
    });
    print(_allFunction.newsList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText.headingMeduim(
                    "David News",
                    height: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: HomeNewsView(),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      AppText.heading(
                        "Latest News",
                        color: Colors.black,
                      )
                    ],
                  ),
                )),
                SliverPinnedHeader(
                    child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              tabsList.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      if (_allFunction.newsList.isNotEmpty) {
                                        prevSelectedIndex = selectedIndex;
                                        selectedIndex = index;

                                        setState(() {});
                                        if (selectedIndex !=
                                            prevSelectedIndex) {
                                          _allFunction.newsList.clear();
                                          Future.delayed(
                                              const Duration(seconds: 1),
                                              () => getNews(
                                                  tabsList[selectedIndex]));
                                        }
                                      }
                                    },
                                    child: Tabs(
                                        color: index == selectedIndex
                                            ? Colors.orange
                                            : Colors.white,
                                        text: tabsList[index]),
                                  ))
                        ],
                      )),
                )),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    ...List.generate(
                        _allFunction.newsList.isEmpty
                            ? 3
                            : _allFunction.newsList.length,
                        (index) => GestureDetector(
                              onTap: () {
                                if (_allFunction.newsList.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsView(
                                              image: _allFunction.newsList[index]
                                                          [ApiKeys.image] ==
                                                      ApiKeys.emptyString
                                                  ? ImageKeys.noImage
                                                  : _allFunction.newsList[index]
                                                          [ApiKeys.image] ??
                                                      ImageKeys.noImage,
                                              author: _allFunction.newsList[index]
                                                      [ApiKeys.author] ??
                                                  "",
                                              time: timeago.format(DateTime.parse(
                                                  _allFunction.newsList[index][ApiKeys.time])),
                                              title: _allFunction.newsList[index][ApiKeys.title],
                                              body: _allFunction.newsList[index][ApiKeys.body])));
                                }
                              },
                              child: _allFunction.newsList.isEmpty
                                  ? const HeadlineSkeletonCard()
                                  : HeadlineCard(
                                      title: _allFunction.newsList[index]
                                          [ApiKeys.title],
                                      topic: _allFunction.newsList[index]
                                          [ApiKeys.topic],
                                      image: _allFunction.newsList[index]
                                                  [ApiKeys.image] ==
                                              ApiKeys.emptyString
                                          ? ImageKeys.noImage
                                          : _allFunction.newsList[index]
                                                  [ApiKeys.image] ??
                                              ImageKeys.noImage,
                                      time: timeago.format(DateTime.parse(
                                          _allFunction.newsList[index]
                                              [ApiKeys.time])),
                                      rights: _allFunction.newsList[index]
                                              [ApiKeys.rights] ??=
                                          ApiKeys.emptyString,
                                      body: _allFunction.newsList[index]
                                              [ApiKeys.body] ??=
                                          ApiKeys.emptyString,
                                      handle: _allFunction.newsList[index]
                                              [ApiKeys.handle] ??=
                                          ApiKeys.emptyString,
                                    ),
                            ))
                  ],
                ))
              ],
            )),
          ],
        ),

        // const HomeNewsView(),
        // const SizedBox(
        //   height: 10,
        // ),
        // AppText.heading(
        //   "Latest News",
        //   color: Colors.black,
        // )
      ),
    );
  }
}
