import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/news_article.dart';
import '../providers/country_code_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/news_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_screen.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final Map<String, String> countryCodes = {
    'in': 'India',
    'us': 'United States',
    'gb': 'United Kingdom',
    'cn': 'China',
    'id': 'Indonesia',
'br': 'Brazil',

  };

  Future<List<NewsArticle?>> fetchTopHeadlines() async {
    final countryCode = context.read<CountryCodeProvider>().countryCode;
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=$newsApiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> articlesJson = data['articles'];

      final articles = articlesJson.map((json) {
        if (json['urlToImage'] != null && json['title'] != null &&
            json['description'] != null && json['publishedAt'] != null &&
            json['source']['name'] != null && json['content'] != null) {
          return NewsArticle.fromJson(json);
        } else {
          return null;
        }
      }).toList();
      return articles;
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<void> _refreshNews() async {
    setState(() {});
  }

  void _showCountryCodeDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: countryCodes.entries.map((entry) {
              return ListTile(
                leading:CountryFlag.fromCountryCode(
                  entry.key,
                  height: 24,
                  width: 30,
                ),

                title: Text('${entry.value} (${entry.key.toUpperCase()})'),
                onTap: () {
                  context.read<CountryCodeProvider>().setCountryCode(entry.key);
                  Navigator.of(context).pop();
                  _refreshNews(); // Fetch news for the new country code
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final countryCode = context.watch<CountryCodeProvider>().countryCode;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('MyNews', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Row(
              children: [
                const Icon(Icons.gps_fixed),
                const SizedBox(width: 4),
                Text(countryCode.toUpperCase(), style: const TextStyle(color: Colors.white)),
              ],
            ),
            onPressed: _showCountryCodeDialog,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Show alert dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<UserProvider>().signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) =>  const LoginScreen()),
                                  (route) => false);
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Top Headlines',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            FutureBuilder<List<NewsArticle?>>(
              future: fetchTopHeadlines(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return const Center(child: Text('An error occurred'));

                  }
                  else {
                    return RefreshIndicator(
                      onRefresh: _refreshNews,
                      child:
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            physics: const NeverScrollableScrollPhysics(),

                            itemBuilder: (context, index) {
                              final article = snapshot.data![index];
                              if (article == null) {
                                return const SizedBox.shrink();
                              }
                              return NewsTile(article: article);
                            },
                          ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
