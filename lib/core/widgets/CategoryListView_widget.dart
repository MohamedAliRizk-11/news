import 'package:flutter/material.dart';
import 'package:news/core/models/Category_model.dart';
import 'package:news/core/widgets/CategoryCard_widgert.dart';

class CategoryListVeiwWidget extends StatelessWidget {
  CategoryListVeiwWidget({super.key});

  List<CategoryModel> catrgoriesList = const [
    CategoryModel(img: "assets/images/Business.jpg", categoryName: "Business"),
    //CategoryModel(img: "assets/images/Politics.jpg", categoryName: "Politics"),
    CategoryModel(
      img: "assets/images/Technology.jpg",
      categoryName: "Technology",
    ),
    // CategoryModel(img: "assets/images/Gaming.jpg", categoryName: "Gaming"),
    CategoryModel(img: "assets/images/Science.jpg", categoryName: "Science"),
    CategoryModel(img: "assets/images/Sports.jpg", categoryName: "Sports"),
    // CategoryModel(img: "assets/images/Music.jpg", categoryName: "Music"),
    // CategoryModel(   img: "assets/images/Environment.jpg",categoryName: "Environment",),
    CategoryModel(img: "assets/images/Health.jpg", categoryName: "Health"),
    CategoryModel(
      img: "assets/images/Entertainment.jpg",
      categoryName: "Entertainment",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: catrgoriesList.length,
        itemBuilder: (context, index) {
          return CatrgoryCardWidget(category: catrgoriesList[index]);
        },
      ),
    );
  }
}
