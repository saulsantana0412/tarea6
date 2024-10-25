import 'package:flutter/material.dart';
import 'package:tarea6/common/color_palette.dart';
import 'package:tarea6/models/weather_model.dart';
import 'package:tarea6/services/weather_service.dart';
import 'package:tarea6/widgets/my_appbar.dart';
import 'package:tarea6/widgets/my_subtitle.dart';
import 'package:tarea6/widgets/my_title.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  late WeatherModel weather;
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    fetchWeather();
  }


  Future<void> fetchWeather() async {
    weather = await WeatherService.fetchWeather();
    print(weather.city);
    
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MyAppBar(title: "Clima en Santo Domingo"),
      body: Center(
        child: isLoading ? const CircularProgressIndicator(): Container(
          width: 300,
          height: 520,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorPalette.ligthblue,
            borderRadius: BorderRadius.circular(20)
          ),
              child: Column(
                children: [
                  MySubtitle(text: weather.city),
                  SizedBox(height: 20,),
                  MyTitle(text: weather.temperature+" °C", size:50),
                  MySubtitle(text: "feels like: "+weather.feelsLike+" °C", color: ColorPalette.gray,),
                  Image.network(weather.iconurl),
                  MySubtitle(text: weather.weather),
                  MySubtitle(text: weather.description),
                  MySubtitle2(text: "Humidity:"+weather.humidity),
                  MySubtitle2(text: "Speed:"+weather.speed)
                ],
              )
            )
      )
    );
  }
}