import 'package:flutter/material.dart';
import 'package:news_app/wodgets/news_category.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../data.dart';

class ListviewCategory extends StatelessWidget {
  const ListviewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: categories.map((category) {
        return NewsCategory(x: category);  // نفس ال Widget اللي انت بتستخدمه
      }).toList(),
      options: CarouselOptions(
        height: 160,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 0.4,  // تتحكم في عرض العنصر
      ),
    );
  }
}
