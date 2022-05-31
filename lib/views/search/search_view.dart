import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/all_functions.dart';
import 'package:news/utils/color.dart';
import 'package:news/utils/text.dart';
import 'package:news/views/news/news_view.dart';
import 'package:news/views/search/search_bar.dart';
import 'package:news/widgets/headline_skeleton.dart';
import 'package:news/widgets/headline_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../core/constants/imageKeys.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, this.q}) : super(key: key);
  final String? q;

  @override
  State<SearchView> createState() => _SearchViewState();
}

final AllFunction _allFunction = AllFunction();

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    // _allFunction.trendingList = [];
    // _allFunction.searchNewsList = [];
    Future.delayed(const Duration(milliseconds: 200), () => init(widget.q));

    super.initState();
  }

  init(q) async {
    if (widget.q != null) await _allFunction.getSearchNews(q);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: kPrimaryColor,
            leading: GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: widget.q != null
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                        )
                      : Container(
                          clipBehavior: Clip.hardEdge,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: CachedNetworkImage(
                            imageUrl: ImageKeys.profileImage,
                          ),
                        )),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchBar(
                                  text: widget.q == null ? "" : widget.q!,
                                )));
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                        color: kPrimaryLightColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width - 135,
                    child: Row(
                      children: [
                        AppText.captionMedium(widget.q == null
                            ? "Search myNEWZ"
                            : '"${widget.q!}"'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 5),
          ),
          SliverPinnedHeader(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: AppText.headingMeduim(widget.q == null
                      ? ""
                      : 'Search result for "${widget.q!}"'))),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...List.generate(
                    _allFunction.searchNewsList.length,
                    (index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsView(
                                        image: "image",
                                        author: "author",
                                        time: "time",
                                        title: "title",
                                        body: "body")));
                          },
                          child: _allFunction.searchNewsList.isEmpty
                              ? const HeadlineSkeletonCard()
                              : HeadlineCard(
                                  title: "title",
                                  topic: "topic",
                                  image: "image",
                                  time: "time",
                                  rights: "rights",
                                  body: "body",
                                  handle: "handle"),
                        ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
