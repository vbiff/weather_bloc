import 'package:bloc_weather_api/models/weather_model.dart';
import 'package:bloc_weather_api/services/weather_api_provider.dart';

class WeatherRepository {
  WeatherProvider _weatherProvider = WeatherProvider();
  Future<Weather> getAllData(String city) async {
    dynamic weatherJson = await _weatherProvider.getWeather(city);
    // print(weatherJson);
    // print(weatherJson['main']['humidity']);
    return Weather.fromJson(weatherJson);
  }
}