
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/widgets/category_card.dart';

// ignore: must_be_immutable
class CategoriesListView extends StatelessWidget {
    CategoriesListView({super.key});
  
 List<CategoryCardModel> categoryList = [
    CategoryCardModel(
      title: 'Business',
      image: 'assets/business-woman.jpg',
    ),
    CategoryCardModel(
      title: 'Sports',
      image: 'assets/sports.jpg',
    ),
    CategoryCardModel(
      title: 'Technology',
      image: 'assets/technology.jpeg',
    ),
    CategoryCardModel(
      title: 'General',
      image: 'assets/general.jpg',
    ),
    CategoryCardModel(
      title: 'Entertainment',
      image: 'assets/entertaiment2.jpg',
    ),
    CategoryCardModel(
      title: 'Health',
      image: 'assets/health.jpg',
    ),
    CategoryCardModel(
      title: 'Science',
      image: 'assets/science.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageStorage(
        bucket: PageStorageBucket(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return  CategoryCard(categorymodelinfo: categoryList[index]);
          },
        ),
      ),
    );
  }
}

