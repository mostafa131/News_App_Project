import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/article.dart';
import '../network/api_service.dart';
import '../wodgets/article_item.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Article>? articles;

  @override
  void initState() {
    super.initState();
    fetchCategoryNews();
  }

  Future<void> fetchCategoryNews() async {
    ApiService apiService = ApiService();
    articles = await apiService.getNews(widget.category.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("${widget.category.name} News",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: articles == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: articles!.length,
        itemBuilder: (context, index) {
          return ArticleItem(article: articles![index]);
        },
      ),
    );
  }
}
