import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

//  Location location = Location();
//  var temperature;
//  var condition;
//  var cityName;

  void getLocationData() async {
//    await location.getCurrentLocation();
//
//    NetworkHelper networkHelper = NetworkHelper(
//        url: 'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22',
//    );
//
    var weatherData = await WeatherModel().getLocationWeather();

//  WeatherModel weatherModel = WeatherModel();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData: weatherData,
        );
      }),
    );
    //    Navigator.pushNamed(context, kLocationScreen);



  }

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
