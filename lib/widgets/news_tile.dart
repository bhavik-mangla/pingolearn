import 'package:flutter/material.dart';

import '../models/news_article.dart';
import '../screens/news_detail_screen.dart';
import '../utils/time_ago.dart';

class NewsTile extends StatelessWidget {
  final NewsArticle article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white,

        elevation: 4, // Adjust elevation for shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners for card
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailScreen(article: article),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.source,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // Adjust font size as needed
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        article.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        timeAgo(article.publishedAt),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),

                    ],
                  ),

                ),
                const SizedBox(width: 8),
                Hero(
                  tag: article.urlToImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      article.urlToImage,
                      height: 150, // Adjust height as needed
                      width: 150, // Adjust width as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
