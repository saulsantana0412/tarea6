import 'dart:convert';
import 'package:http/http.dart' as http;

class GenderService {
  static Future<bool?> fetchGender(String name) async{
    final response = await http.get(Uri.parse("https://api.genderize.io/?name=$name"));

    if (response.statusCode == 200){
      var json = jsonDecode(response.body);
      String gender = json["gender"];
      print(gender == "male");
      return gender == "male";
    } else {
      return null;
    }
  }
}