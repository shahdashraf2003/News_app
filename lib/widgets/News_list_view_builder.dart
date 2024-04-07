// ignore_for_file: file_names, duplicate_ignore, must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder( {super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio(),).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return   ErrorMessage(message: 'Oops! No News to dispaly,try later!',);
          }else{
            return const Indicator();
          }
        });
  }
}

class ErrorMessage extends StatelessWidget {

   const ErrorMessage( {
    super.key, required this.message, 
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Center(
        child: Text(
           message,
            style:  TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
          ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        heightFactor: 10.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
