import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/views/news_view.dart';

class NewStyle extends StatelessWidget {
  const NewStyle({super.key, required this.article});
  final ArticleModel article;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
         context,
           MaterialPageRoute(
            builder: (context) => NewsView(url: article.url),
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(
              article.image ??'https://media.wired.com/photos/660b3d3fd376bb0b921ed38a/191:100/w_1280,c_limit/business_apple_employees_palestine_letter.jpg',
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            article.subtitle ?? '',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
