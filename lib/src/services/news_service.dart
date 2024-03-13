import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '244540bb56ea453da0b3aae761e1e344';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  List<Category> categories = [
    Category(Icons.business, 'business'),
    Category(Icons.sports, 'sports'),
    Category(Icons.science, 'science'),
    Category(FontAwesomeIcons.memory, 'technology'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
  ];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    final answer = await http.get(Uri.parse(url));

    final newsResponse = NewResponse.fromJson(answer.body);

    headlines.addAll(newsResponse.articles);
    print('Headlines: ${headlines.length}');//This is for debugging
    notifyListeners();
  }
}