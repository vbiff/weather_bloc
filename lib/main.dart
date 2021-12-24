import 'package:bloc_weather_api/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_weather_api/bloc/weather_bloc.dart';
import 'package:bloc_weather_api/services/weather_repository.dart';
// import 'pages/home_page.dart';
// import 'pages/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final weatherRepository = WeatherRepository();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weatherRepository: weatherRepository),
      child: HomePage(),
    ),
    );
  }
}

    // return MaterialApp(

    //   home: HomePage(),
    // );
  
