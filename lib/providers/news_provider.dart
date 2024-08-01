import 'package:flashnews/models/Article.dart';
import 'package:flashnews/services/news_services.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  bool _isloading = false;
  String? _error;
  List<Article> _articles = [];

  bool get isLoading => _isloading;
  String? get error => _error;
  List<Article> get articles => _articles;

  NewsProvider() {
    fetchNews();
  }

  Future<void> fetchNews() async {
    _isloading = true;
    notifyListeners();
    try {
      _articles = await NewsServices().fetchNews();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
