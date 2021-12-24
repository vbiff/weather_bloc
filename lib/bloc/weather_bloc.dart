import 'package:bloc_weather_api/bloc/weather_event.dart';
import 'package:bloc_weather_api/bloc/weather_state.dart';
import 'package:bloc_weather_api/models/weather_model.dart';
import 'package:bloc_weather_api/services/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherEmptyState());


  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherLoadEvent) {
      yield WeatherLoadingState();
      try {
        final Weather _loadedWeather = await weatherRepository.getAllData(event.city);
        yield WeatherLoadedState(loadedWeather: _loadedWeather);
      } catch (_) {
        yield WeatherErrorState();
      }
    } else if (event is WeatherClearEvent) {
      yield WeatherEmptyState();
    }
  }
}