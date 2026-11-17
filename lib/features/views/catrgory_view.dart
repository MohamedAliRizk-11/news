import 'package:flutter/material.dart';
import 'package:news/core/widgets/NewsListView_widget.dart';

class CatrgoryView extends StatelessWidget {
  const CatrgoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [NewslistviewWidget(category: category)],
        ),
      ),
    );
  }
}
