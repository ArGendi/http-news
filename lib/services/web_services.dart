import 'dart:convert';

import 'package:code_academy_http/model/news.dart';
import 'package:http/http.dart';

class WebServices{
  Future<List<News>?> getNews() async{
    try{
      Response response = await get(
        Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-11-03&sortBy=publishedAt&apiKey=7cbef3e0859e47bea7efc555e5a5b35e'),
        headers: {
          'Content-Type': "application/json"
        },
      );
      if(response.statusCode >= 200 && response.statusCode < 300){
        Map json = jsonDecode(response.body);
        List<News> news = [];
        for(var article in json['articles']){
          news.add(News.fromJson(article));
        }
        return news;
      }
      else{
        print("error in http request ${response.statusCode}");
        return null;
      }
    }
    catch(e){
      return null;
    }
  }
}