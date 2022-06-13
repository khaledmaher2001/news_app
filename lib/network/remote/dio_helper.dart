import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

Dio dio;

class DioHelper {
  static initial() {
    dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
  @required String url,
    @required Map<String,dynamic> query,
})async{

    return await dio.get("$url",
    queryParameters: query,
    );
  }
}


// base Url : https://newsapi.org/
// method : v2/top-headlines?
// query : country=eg&category=business&apiKey=f824fa9978ee4cc79b7dee0fe22c3a7c
