import 'package:flutter/material.dart';

import 'package:news/core/widgets/CategoryListView_widget.dart';

import 'package:news/core/widgets/NewsListView_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("News", style: TextStyle(color: Colors.black)),
            Text(
              "Cloud",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoryListVeiwWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            NewslistviewWidget(category: 'general'),
          ],
        ),
      ),
    );
  }
}


/*

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news/core/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=63aa4419858d479c956239e81944ed57&category=$category',
    );

    // Convert list of maps to list of objects
    Map<String, dynamic> jsonData = response.data;

    List<dynamic> articles = jsonData["articles"];

    List<ArticleModel> articleList = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(article);

      articleList.add(articleModel);
    }

    return articleList;
  }
}


*/

//63aa4419858d479c956239e81944ed57