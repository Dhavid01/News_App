import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:news/views/home/home_view.dart';
import 'package:news/views/search/search_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeViewState();
}

int _selectedPage = 0;
PageController _pageController = PageController();

class _HomeViewState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    onPageChange(int index) {
      setState(() {
        _selectedPage = index;
      });
      _pageController.jumpToPage(index);
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          onPageChanged: onPageChange,
          controller: _pageController,
          children: const [
            HomeView(),
            SearchView(),
            // BookmarkView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 25,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 25,
                ),
                label: ""),
          ],
          currentIndex: _selectedPage,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          onTap: onPageChange,
        ),
      ),
    );
  }
}
