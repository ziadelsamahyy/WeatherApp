import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children:
          [
            Expanded(
              child: Center(
                child:Image.asset('assets/images/weather.png',
                  height: 250,width: 250,
                ),
              ),
            ),
            // Image.asset('assets/images/weather.png',
            //   height: 250,width: 250,
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            SpinKitFadingCircle(
              color: Colors.orange,
            ),
            Text('Developed by ZiadElsamahy',
            style:TextStyle(
              color: Colors.grey,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
