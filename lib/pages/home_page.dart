import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  },
                ));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There is NO weather😔\nStart searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            )
          : Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
          ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Text(
                    // 'Updated :${}',
                    'Updated: ${weatherData!.date}',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        '${weatherData!.temp.toInt()}',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                      Column(
                        children: [
                          Text('max: ${weatherData!.maxTemp!.toInt()}'),
                          Text('min: ${weatherData!.minTemp!.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                      weatherData!.weatherStateName,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
    );
  }
}
