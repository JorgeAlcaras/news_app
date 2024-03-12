import 'dart:convert';

class NewResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewResponse.fromJson(String str) => NewResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewResponse.fromMap(Map<String, dynamic> json) => NewResponse(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
  };
}

class Article {
  Source source;
  String author;
  String title;
  dynamic description;
  String url;
  dynamic urlToImage;
  DateTime publishedAt;
  dynamic content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Article.fromMap(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toMap() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}


class Source {
  String id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] == null ? null : json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name,
  };
}