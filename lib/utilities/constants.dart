import 'package:flutter/material.dart';

//api key
const String kApiKey = 'd4f738e3ec5ddbc871620024d8eae6ec';
const String kOpenWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

//routes
const String kLoadingScreen = '/';
const String kLocationScreen = '/location';
const String kCityScreen = '/city';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize:60.0,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city, color: Colors.white,),
    hintText: 'Enter city name',
    hintStyle: TextStyle(

      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    )
);
