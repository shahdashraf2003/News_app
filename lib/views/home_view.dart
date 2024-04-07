// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/News_list_view_builder.dart';
import 'package:news_app_ui_setup/widgets/categories_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            text: 'News',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Cloud',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
               const NewsListViewBuilder(category: ''),
          ],
        ),
      ),
    );
  }
}
