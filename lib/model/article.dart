import 'dart:convert';

class Article {
  final String id;
  final String title;
  final String urlImg;
  final String desc;

  Article({this.id, this.title, this.urlImg, this.desc});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      urlImg: json['urlImg'],
      desc: json['description'],
    );
  }
}

List<Article> parseArticle(String json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((e) => Article.fromJson(e)).toList();
}
