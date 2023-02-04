import 'package:climate_api_app/services/location.dart';
import 'package:climate_api_app/services/networking.dart';

const apiKey = '8e34cea759ad4fd7e2fdf0a12216ea28';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';


class WeatherModel {


  Future <dynamic> getCityName(String cityName) async {
   var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric'; 
   NetworkHelper networkHelper = NetworkHelper(url: url);

   var weatherData = await networkHelper.getData();
   return weatherData;
  }

  Future <dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(condition) {
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