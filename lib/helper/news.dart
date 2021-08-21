import 'dart:convert';
import 'dart:developer';

import 'package:fnews_app/config.dart';
import 'package:fnews_app/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<ArticleModel> getNews() async {
    String apiUrl =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";
//     var response = await http.get(Uri.parse(apiUrl));
//     var jsonResponse = jsonDecode(response.body);

//     log('news: $jsonResponse');
//     if (jsonResponse['status'] == 'ok') {

// return ArticleModel.fromJson(jsonDecode(response.body));

//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);

      return ArticleModel.fromJson(jsonDecode(response.body));
    } else
      (throw Exception('Failed to load ac list data'));
  }
}
