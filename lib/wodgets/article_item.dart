import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  (article.image != null && article.image!.isNotEmpty)
                      ? article.image!
                      : "https://images.pexels.com/photos/6700370/pexels-photo-6700370.jpeg",
                ),

              ),
            ),
          ),
          SizedBox(height: 5),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
               article.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

          Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              article.desc??"ERROR",style: TextStyle(color: Colors.grey),),

        ],
      ),
    );
  }
}
