

abstract class WeatherEvent {}

class WeatherLoadEvent extends WeatherEvent {
  final city;
  WeatherLoadEvent ({required this.city});

}

class WeatherClearEvent extends WeatherEvent {}