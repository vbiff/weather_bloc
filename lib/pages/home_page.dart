import 'package:bloc_weather_api/bloc/weather_bloc.dart';
import 'package:bloc_weather_api/bloc/weather_event.dart';
import 'package:bloc_weather_api/bloc/weather_state.dart';
import 'package:bloc_weather_api/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  // final weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {

      if (state is WeatherEmptyState) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green[300],
            title: Text('WeatherApp'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 34,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green, style: BorderStyle.solid)),
                        hintText: "City Name",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[300])),
                        onPressed: () {
                          weatherBloc
                              .add(WeatherLoadEvent(city: cityController.text));
                          print(cityController.text);
                        },
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.black),
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );


      } else if (state is WeatherLoadingState) {
        return Center(child: CircularProgressIndicator());

        
      } else if (state is WeatherLoadedState) {
        return ResultPage(weather: state.getWeather);


      } else if (state is WeatherErrorState) {
        return Center(
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[300])),
            onPressed: () {
              weatherBloc.add(WeatherClearEvent());
            },
            child: Text(
              'Ошибка получения данных',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      return Center(
        child: Text(
          'Ошибка получения данных',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    });
  }
}
