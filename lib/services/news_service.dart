import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  final Dio dio;
  
  NewsService(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      final response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=7ebcab5895a943ec88ab3bce3b0cf7c5&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
         ArticleModel articleModel = ArticleModel.fromJson(article);
          articleList.add(articleModel);
      }
      return articleList;

    } catch (e) {
      return [];
    }
  }
}
