import 'package:flutter/material.dart';

import 'package:news/core/models/article_model.dart';

import 'package:news/core/services/news_service.dart';

import 'package:dio/dio.dart';

import 'newsTile_widget.dart';

class NewslistviewWidget extends StatefulWidget {
  const NewslistviewWidget({super.key, required this.category});
  final String category;
  @override
  State<NewslistviewWidget> createState() => _NewslistviewWidgetState();
}

class _NewslistviewWidgetState extends State<NewslistviewWidget> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: snapshot.data!.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: NewstileWidget(articleModel: snapshot.data![index]),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text("Oooooops! .. there was an error , try again..!"),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
