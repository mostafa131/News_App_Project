import 'package:dio/dio.dart';
import 'package:news_app/model/article.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Article>> getNews(String category) async {
    var response = await dio.get(
      "https://newsapi.org/v2/top-headlines",
      queryParameters: {
        "country": "us",
        "category": category,
        "apiKey": "e226ff65ccf24bd181b500b15483ce94",
      },
    );
    print("API RESPONSE: ${response.data}");

    Map<String, dynamic> json = response.data;
    List<Article> articles = [];
    for (var item in json["articles"]) {
      articles.add(
        Article(
          name: item["title"]??"",
          image: item["urlToImage"]??"",
          desc: item["description"]??"",
          url: item["url"]??"",
        ),
      );
    }
    print("Articles Count: ${articles.length}");
    return articles;
  }
}
