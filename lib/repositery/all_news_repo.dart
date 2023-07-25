import 'dart:convert';

import 'package:app_with_api/Model/all_news_model/all_news_model.dart';
import 'package:http/http.dart' as http;

class AllNewsRepo {
  Future<AllNewsModel?> getNews() async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cc46aa62d42046289db7b69cdc0ea0e5"));

      Map<String, dynamic> decodeResponse = json.decode(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        AllNewsModel data = AllNewsModel.fromJson(decodeResponse);
        print(data.articles![0].content);

        return data;
      } else {
        return null;
      }
    } catch (error) {
      print("error : $error");
      return null;
    }
  }
}
