import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

import '../screens/category_screen.dart';

class NewsCategory extends StatelessWidget {
  final Category x;

  const NewsCategory({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(category: x),
          ),
        );

      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 55,
          backgroundImage:
          NetworkImage(x.image),
          child: Text(x.name,style: TextStyle( fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),
        ),
      ),
    );
  }
}
