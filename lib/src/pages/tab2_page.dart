import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    final news = Provider.of<NewsService>(context).articlesCategorySelected;

    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          _CategoryList(),
          Expanded(
            child: ListNews(news: news),
          )
        ]),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    final newsService = Provider.of<NewsService>(context);

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final categoryName = categories[index].name;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                Text(
                    '${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryNews category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        print(category.name);
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.setSelectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
        child: Icon(category.icon,
            color: (newsService.selectedCategory == category.name)
                ? Colors.white
                : Colors.black26),
      ),
    );
  }
}
