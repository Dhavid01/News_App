import 'package:news/services/news_services.dart';

class AllFunction {
  List<Map<String, dynamic>> newsList = [];
  List<Map<String, dynamic>> searchNewsList = [];
  List<Map<String, dynamic>> trendingList = [];
  List<Map<String, dynamic>> bookmarkList = [];
  int page = 1;

  static final NewsService _newsService = NewsService();

  getNews(q) async {
    page++;
    newsList.addAll(await _newsService.getNewsByKeyword(q: q, page: page));
  }

  getSearchNews(q) async {
    searchNewsList = await _newsService.getNewsByKeyword(q: q, page: page);
  }

  getTrendingAndLatest(q, page) async {
    trendingList = await _newsService.getLatestNews(q: q, page: page);
  }

  addBookmark(Map<String, dynamic> item) {
    bookmarkList.add(item);
    print(bookmarkList.length);
  }

  removeBookmark(Map<String, dynamic> item) {
    bookmarkList.remove(item);
  }

  getMoreNews(q) {
    page++;
    if (page < _newsService.totalPages) {
      getNews(q);
      print("$page is less than ${_newsService.totalPages}");
    }
  }
}
