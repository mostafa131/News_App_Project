import 'package:flutter/material.dart';
import 'package:news_app/wodgets/article_item.dart';
import 'package:news_app/wodgets/article_listview.dart';
import 'package:news_app/wodgets/listview_category.dart';
import 'package:news_app/wodgets/news_category.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  bool title = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("News App", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ListviewCategory()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "General News",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ArticleListview(category: "general"),
        ],
      ),
    );
  }
}
