import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

import '../services/weather.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.weatherData});

  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}





class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;



  void updateUI(dynamic weatherData){

    if(weatherData == null){
      temperature = 0;
      weatherIcon = 'Error';
      cityName = '';
      weatherMessage = 'Unable to get weather data';
      return;
    }

    temperature = weatherData['main']['temp'].toInt();
    var condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];

    weatherIcon = weatherModel.getWeatherIcon(condition);
    
    weatherMessage = weatherModel.getMessage(temperature);
    

//    print(cityName);
  }


  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    SizedBox(width: 20.0,),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//temperature = decodedData['main']['temp'];
//condition = decodedData['weather'][0]['id'];
//cityName = decodedData['name'];