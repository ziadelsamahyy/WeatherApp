import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  // Custom data comes from the net
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  String getImage () {
    if(weatherStateName == 'Thunderstorm'||weatherStateName == 'Thunder')
    {
      return 'assets/images/thunderstorm.png';
    }
    else if(weatherStateName == 'Clear' || weatherStateName == 'Light cloud'){
      return 'assets/images/clear.png';
    }
    else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail'){
      return 'assets/images/snow.png';
    }
    else if(weatherStateName == 'Heavy cloud' || weatherStateName == 'Partly cloudy'){
      return 'assets/images/cloudy.png';
    }
    else if(weatherStateName == 'Light rain' || weatherStateName == 'Heavy rain' || weatherStateName == 'Showers' || weatherStateName == 'Patchy rain possible'){
      return 'assets/images/rainy.png';
    }
    else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor () {
    if(weatherStateName == 'Thunderstorm' ||weatherStateName == 'Thunder' )
    {
      return Colors.blue;
    }
    else if(weatherStateName == 'Clear' || weatherStateName == 'Light cloud'){
      return Colors.orange;
    }
    else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail'){
      return Colors.blue;
    }
    else if(weatherStateName == 'Heavy cloud' || weatherStateName == 'Partly cloudy'){
      return Colors.blueGrey;
    }
    else if(weatherStateName == 'Light rain' || weatherStateName == 'Heavy rain' || weatherStateName == 'Showers' || weatherStateName == 'Patchy rain possible'){
      return Colors.blue;
    }
    else {
      return Colors.orange;
    }
  }
}
