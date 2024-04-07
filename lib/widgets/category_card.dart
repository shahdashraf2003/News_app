import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categorymodelinfo});
  final CategoryCardModel categorymodelinfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => CategoryView(
              category: categorymodelinfo.title,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              image: AssetImage(categorymodelinfo.image),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Text(
              categorymodelinfo.title,
              style: const TextStyle(
                fontSize: 20,
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
