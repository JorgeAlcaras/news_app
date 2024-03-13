import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
           Expanded(child: _CategoryList())
       ]
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({super.key});

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return  ListView.builder(
      physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(categories[index].icon, size: 30, color: Colors.black54,),
                Text(categories[index].name)
              ],
            ),
          );
        },
    );
  }
}
