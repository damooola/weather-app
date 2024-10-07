import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/services/weather_services.dart';
import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
// api key
  final _weatherService = WeatherServices("1b1f7a0e93a081a6a14d2b9adfecb904");
  Weather? _weather;
// get weather
  fetchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();

    // get weather for current city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // get weather
    fetchWeather();
  }

// weather animation
  String weatherAnimation(String? weatherCondition) {
    if (weatherCondition == null) {
      return "assets/sunny.json";
    }
    switch (weatherCondition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "haze":
      case "smoke":
      case "dust":
      case "fog":
        return "assets/cloudy.json";
      case "rain":
      case "shower rain":
      case "drizzle":
        return "assets/shower.json";
      case "thunderstorm":
        return "assets/thunder.json";
      case "clear":
        return "assets/sunny.json";
      default:
        return "assets/sunny.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // city name
              Text(
                _weather?.cityName ?? "Loading City...",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),

              // animation
              Lottie.asset(weatherAnimation(_weather?.mainCondition)),

              // city temperature
              Text(
                "${_weather?.temperature.round() ?? ""}°C",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              //weather condition
              Text(
                "${_weather?.mainCondition}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
