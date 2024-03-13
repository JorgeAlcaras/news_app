import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/models/category_model.dart';
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

        final categoryName = categories[index].name;

          return GestureDetector(
            onTap: () {
              print(categories[index].name);
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _CategoryButton(categories[index]),
                    Text('${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final CategoryNews category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black12
      ),
      child:  Center(
        child: Icon(category.icon, color: Colors.black54,),
      ),
    );
  }
}
