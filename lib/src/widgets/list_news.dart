import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';

class ListNews extends StatelessWidget {

  final List<Article> news;

  const ListNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
      return Text(news[index].title);
    });
  }
}
