import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '244540bb56ea453da0b3aae761e1e344';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<CategoryNews> categories = [
    CategoryNews(Icons.business, 'business'),
    CategoryNews(Icons.sports, 'sports'),
    CategoryNews(Icons.science, 'science'),
    CategoryNews(FontAwesomeIcons.memory, 'technology'),
    CategoryNews(FontAwesomeIcons.tv, 'entertainment'),
    CategoryNews(FontAwesomeIcons.headSideVirus, 'health'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    for (var item in categories) {
      categoryArticles[item.name] = [];
    }

    getArticlesByCategory(_selectedCategory);
  }

  get selectedCategory => _selectedCategory;

  set setSelectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get articlesCategorySelected =>
      categoryArticles[_selectedCategory] ?? [];

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    final answer = await http.get(Uri.parse(url));

    final newsResponse = NewResponse.fromJson(answer.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category=$category';
    final answer = await http.get(Uri.parse(url));

    final newsResponse = NewResponse.fromJson(answer.body);

    categoryArticles[category]?.addAll(newsResponse.articles);

    notifyListeners();
  }
}
