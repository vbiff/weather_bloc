import 'package:bloc_weather_api/bloc/weather_bloc.dart';
import 'package:bloc_weather_api/models/weather_model.dart';
import 'package:bloc_weather_api/bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_weather_api/bloc/weather_event.dart';

class ResultPage extends StatelessWidget {
  Weather? weather;

  ResultPage({this.weather});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green[300],
            title: Text('WeatherApp'),
            centerTitle: true,
            actions: [
              TextButton.icon(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    weatherBloc.add(WeatherClearEvent());
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back')),
            ],
          ),
          body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: 50.0),
                    Text('City: ${weather?.name}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 10.0),
                    Text('Temperature: ${weather?.temp} Celcius',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    Text('Humidity: ${weather?.humid} %',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    Text('Wind Speed: ${weather?.windspeed} m/s',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
