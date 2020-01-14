import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'screens/loading_screen.dart';
import 'utilities/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
//      initialRoute: kLoadingScreen,
//      routes: {
//        kLoadingScreen: (context) => LoadingScreen(),
//        kLocationScreen: (context) => LocationScreen(),
//        kCityScreen: (context) => CityScreen(),
//      },
    );
  }
}
