import 'package:flutter/material.dart';

class WeatherModel {
  String city;
  String iconurl;
  String temperature;
  String feelsLike;
  String weather;
  String description;
  String humidity;
  String speed;

  WeatherModel(this.city, this.iconurl, this.temperature, this.feelsLike, this.weather, this.description, this.humidity, this.speed);
}