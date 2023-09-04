import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (data) async{
              cityName = data;
              WeatheServices  service = WeatheServices();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              labelText: 'Search',
              hintText: 'Enter City Name',
             suffixIcon: GestureDetector(
               onTap: () async{
                 WeatheServices  service = WeatheServices();
                 WeatherModel? weather = await service.getWeather(cityName: cityName!);
                 Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                 Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                 Navigator.pop(context);

               },
                 child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
