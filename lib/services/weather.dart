

import '../utilities/constants.dart';
import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      url: '$kOpenWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric',
//      url: 'http://api.openweathermap.org/data/2.5/weather?lat=50.835010&lon=4.420300&appid=d4f738e3ec5ddbc871620024d8eae6ec',
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
