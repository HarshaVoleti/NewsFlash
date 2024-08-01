class Source {
  String id;
  String name;
  Source({required this.id, required this.name});
}

class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  Source source;
  String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? 'NA',
      title: json['title'] ?? 'NA',
      description: json['description'] ?? 'NA',
      url: json['url'] ?? 'NA',
      urlToImage: json['urlToImage'] ?? 'NA',
      publishedAt:
          DateTime.parse(json['publishedAt'] ?? DateTime.now().toString()),
      source: Source(
        id: json['source']['id'] ?? 'NA',
        name: json['source']['name'] ?? 'NA',
      ),
      content: json['content'] ?? 'NA',
    );
  }
}
