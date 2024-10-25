import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tarea6/models/new_model.dart';

class NewsService {
  static Future<List<NewModel>> getNews() async {
    final response = await http.get(Uri.parse("https://cnnespanol.cnn.com/wp-json/wp/v2/posts"));
    List<NewModel> newsList = [];

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        int newsCount = 0;
        for (var item in data) {
          if (newsCount < 3) {
            NewModel n = NewModel(
              item["title"]["rendered"],
              item["excerpt"]["rendered"],
              item["link"],
            );
            newsList.add(n);
            newsCount++;
          } else {
            break;
          }
        }
      } catch (e) {
        print("Error parsing JSON: $e");
      }
    } else {
      print("Failed to load news: ${response.statusCode}");
    }
    return newsList;
  }
}
