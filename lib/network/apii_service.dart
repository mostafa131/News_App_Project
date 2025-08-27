import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://newsapi.org/";
  final Dio dio = Dio();
  get ({required String endPoint})async{
    var response = await dio.get("$_baseUrl$endPoint");
    return response.data;
  }

  post ({required String endPoint})async{
    var response = await dio.post("$_baseUrl$endPoint");
    return response.data;
  }


}