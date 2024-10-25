import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tarea6/models/university_model.dart';

class UniversityService {
  static Future<List<UniversityModel>> fetchUniversities(String country) async {
    final response = await http
        .get(Uri.parse("http://universities.hipolabs.com/search?country=$country"));
    List<UniversityModel> universitiesList = [];

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        for (var item in data) {
          String name = item["name"];
          String page = item["web_pages"][0];
          UniversityModel university = UniversityModel(name, page);
          universitiesList.add(university);
        }
      } catch (e) {
        print("Error parsing JSON: $e");
      }
    } else {
      print("Failed to load universities: ${response.statusCode}");
    }
    return universitiesList;
  }
}
