import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/splash_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.indigo
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
        brightness: Brightness.light,
        primaryColorLight: Colors.blue,
        //useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
