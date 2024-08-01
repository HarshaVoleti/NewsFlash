import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flashnews/models/Article.dart';
import 'package:flashnews/services/remote_config.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  String apiKey = RemoteConfig.getString('apiKey');
  String countryCode = RemoteConfig.getString('country_code');
  Future<List<Article>> fetchNews() async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=$apiKey',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data['articles']);
      List<Article> articles = [];

      data['articles'].forEach((a) {
        Article article = Article.fromJson(a);
        articles.add(article);
      });
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
