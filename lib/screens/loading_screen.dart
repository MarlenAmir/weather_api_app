import 'package:flutter/material.dart';
import 'package:climate_api_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate_api_app/services/weather.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationWeather();


    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(LocationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100,
        ),
        
      ),
    );
  }
}
