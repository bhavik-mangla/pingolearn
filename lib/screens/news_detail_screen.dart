import 'package:flutter/material.dart';
import '../models/news_article.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: article.urlToImage,
              child: Image.network(article.urlToImage),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Text(
                    article.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 16.0),
                  Text(article.description),
                  const SizedBox(height: 16.0),
                  Text(article.content ),
                  const SizedBox(height: 16.0),
                  Text('Source: ${article.source}'),
                  Text('Published at: ${article.publishedAt}'),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
