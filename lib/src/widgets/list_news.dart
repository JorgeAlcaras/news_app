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
      return _News(news: news[index], index: index);
    });
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;
  const _News({super.key, required this.news, required this.index});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(news: news, index: index),
        _CardTitle(news),
        _CardImage(news),
        _CardBody(news),
        _CardButtons(),
        const SizedBox(height: 10),
        const Divider()
      ],
    );
  }
}

class _CardButtons extends StatelessWidget {
  const _CardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.star_border),
            ),
            const SizedBox(width: 10),
          ]
      ),
    );
  }
}


class _CardBody extends StatelessWidget {
  final Article news;
  const _CardBody(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(news.description != null ? news.description! : 'Description not available')
    );
  }
}




class _CardImage extends StatelessWidget {
  final Article news;

  const _CardImage(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child:  Container(
          child:  news.urlToImage != null
              ? FadeInImage(
            placeholder: const AssetImage('assets/images/giphy.gif'),
            image: NetworkImage(news.urlToImage!),
          )
              : const Image(image: AssetImage('assets/images/no-image.png'))
        ),
      ),
    );
  }
}


class _CardTitle extends StatelessWidget {
  final Article news;

  const _CardTitle(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(news.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
    );
  }
}


class _CardTopBar extends StatelessWidget {

final Article news;
final int index;

  const _CardTopBar({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('${index + 1}. ', style: const TextStyle(color: Colors.blue)),
          Text('${news.source.name}. '),
        ],
      )
    );
  }
}

