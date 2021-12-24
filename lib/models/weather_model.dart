

class Weather {
  String name;
  String temp;
  String humid;
  String windspeed;

  Weather({required this.name,
  required  this.temp,
  required  this.humid,
  required  this.windspeed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      temp: (json['main']['temp'] - 272.5).toStringAsFixed(2),
      humid: json['main']['humidity'].toString(),
      windspeed: json['wind']['speed'].toString(),
    );
  }
}