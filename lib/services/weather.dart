import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'e8f9f0ef3b057b4ad0b544ea9fce622e';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        Uri.parse('$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric');
    NetworkHelper nh = NetworkHelper(url);
    var weatherData = await nh.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    final uri = Uri.parse(
        '$openWeatherMapURL?lat=${loc.latitide}&lon=${loc.longitude}&appid=$apikey&units=metric');
    NetworkHelper nh = NetworkHelper(uri);

    var weatherData = await nh.getData();
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
