import 'package:flutter/material.dart';
import 'package:news/core/models/Category_model.dart';
import 'package:news/features/views/catrgory_view.dart';

class CatrgoryCardWidget extends StatelessWidget {
  const CatrgoryCardWidget({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CatrgoryView(category: category.categoryName);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Container(
          height: 85,
          width: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.img),
            ),
            borderRadius: BorderRadius.circular(5),
            color: Colors.amber,
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
