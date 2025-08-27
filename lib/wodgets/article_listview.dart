import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/network/api_service.dart';
import 'package:news_app/wodgets/article_item.dart';

class ArticleListview extends StatefulWidget {
final String category;
  const ArticleListview({super.key, required this.category});

  @override
  State<ArticleListview> createState() => _ArticleListviewState();
}

class _ArticleListviewState extends State<ArticleListview> {
  List<Article>? x;
  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return x==null?SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())): SliverList.builder(

      itemBuilder: (context,index){
        return ArticleItem(article: x![index],);
      },itemCount: x!.length ,);
  }


  get()async{
    ApiService apiService = ApiService();
    x = await apiService.getNews(widget.category);
    setState(() {

    });
  }
}
