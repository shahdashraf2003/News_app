import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/new_style.dart';



class NewsListView extends StatelessWidget {
  final  List<ArticleModel> articles;
  const NewsListView({super.key, required , required this.articles,});
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
          return NewStyle(
            article: articles[index],
          );
        }),
      );
  }
}
