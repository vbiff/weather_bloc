
import 'package:bloc_weather_api/models/weather_model.dart';


abstract class WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final dynamic loadedWeather;
  WeatherLoadedState({required this.loadedWeather});

  Weather get getWeather => loadedWeather;
}

class WeatherErrorState extends WeatherState {
}