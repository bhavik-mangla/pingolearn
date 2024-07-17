class NewsArticle {
  final String source;
  final String title;
  final String description;
  final String content;

  final String urlToImage;
  final String publishedAt;

  NewsArticle({required this.source, required this.title, required this.description, required this.content,required this.urlToImage, required this.publishedAt});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      source: json['source']['name'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      urlToImage: json['urlToImage'] ,
      publishedAt: json['publishedAt'],
    );
  }
}
