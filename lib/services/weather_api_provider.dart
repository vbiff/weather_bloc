import 'dart:convert';

import 'package:bloc_weather_api/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherProvider {
  // api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=9b15ca542d1989a0f8b44be657f1bebc

  Future<dynamic> getWeather(String city) async {
    final response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=9b15ca542d1989a0f8b44be657f1bebc'));

      if (response.statusCode != 200) {
          throw Exception('error getting weather for location');
          }

          final weatherJson = jsonDecode(response.body);
          //print(weatherJson);
          return weatherJson;
          //return Weather.fromJson(weatherJson);
       }

  }


