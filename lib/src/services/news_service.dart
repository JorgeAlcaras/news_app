import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '244540bb56ea453da0b3aae761e1e344';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

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