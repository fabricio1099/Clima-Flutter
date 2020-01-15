import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:country_code/country_code.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  String countryCode; // ISO 3166-1 alpha-2

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/city_background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),

        child: SafeArea(
          child: Column(
            children: <Widget>[

              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  value: countryCode,
                  isExpanded: true,
                  icon: Icon(Icons.flag),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      countryCode = newValue;
                    });
                  },
                  items: <String>['USA', 'BEL', 'CAN', 'FRA']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value){
                    cityName = value;
                  },
                ),
              ),

              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
