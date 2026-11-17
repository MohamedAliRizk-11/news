import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news/core/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': '63aa4419858d479c956239e81944ed57',
          'category': category.trim().toLowerCase(),
        },
      );

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articleList.add(articleModel);
      }

      return articleList;
    } catch (e, stackTrace) {
      debugPrint('========== NEWS ERROR ==========');
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      debugPrint('================================');
      rethrow;
    }
  }
}
