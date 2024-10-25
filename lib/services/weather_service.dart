import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tarea6/models/weather_model.dart';


class WeatherService {

static Future<WeatherModel> fetchWeather() async {
  final apiKey = 'e46e2ca882338ae8d7c81258806142da';
  final city = 'Santo Domingo';
  final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
  final response = await http.get(Uri.parse(url));

  String weather = ""; 
  String description = ""; 
  String iconurl = "https://openweathermap.org/img/wn/09d@4x.png"; 
  String cityc = ""; 
  String temperature = ""; 
  String feelslike = ""; 
  String humidity = ""; 
  String speed = ""; 
  
  WeatherModel weatherModel;

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);    

    weather = data["weather"][0]["main"]; 
    description = data["weather"][0]["description"]; 
    String icon = data["weather"][0]["icon"];
    iconurl = "https://openweathermap.org/img/wn/$icon@4x.png"; 
    cityc= data["name"]; 
    temperature = data["main"]["temp"].toString(); 
    feelslike = data["main"]["feels_like"].toString(); 
    humidity = data["main"]["humidity"].toString(); 
    speed = data["wind"]["speed"].toString(); 

    weatherModel = WeatherModel(cityc, iconurl, temperature, feelslike, weather, description, humidity, speed);
    return weatherModel;

  } else {
    print('Error al obtener el clima: ${response.statusCode}');
  }

  return WeatherModel(cityc, iconurl, temperature, feelslike, weather, description, humidity, speed);
}

}