import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatheServices{

  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey ='09a3ad188ebe4c9ba64212908231908';


  Future<WeatherModel?> getWeather({required String cityName}) async
  {
    WeatherModel? weather ;
    try{
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5');
      http.Response response  = await http.get(url);
      Map< String , dynamic> data = jsonDecode(response.body) ;
       weather = WeatherModel.fromJson(data);
    }catch(e){
      print(e);
    }
    return weather ;
  }
}