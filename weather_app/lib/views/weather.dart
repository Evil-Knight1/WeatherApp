import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors(weatherModel.condition)
          ,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            'Updated At ${weatherModel.date}',
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: NetworkImage('https:${weatherModel.image}'),
                ),
                Text(
                  '${weatherModel.temp}',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('MaxTemp: ${weatherModel.maxTemp.round()}'),
                    Text('MinTemp: ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
          ),
          Text(
            weatherModel.condition,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ],
      ),
    );
  }
  List<Color> gradientColors(String condition) {
    condition = condition.toLowerCase();
    if (condition.contains('sunny') ) {
      return [Colors.orange, Colors.white];
    } else if (condition.contains('cloud') ) {
      return [Colors.blue, Colors.white];
    } else if (condition.contains('rain') ) {
      return [Colors.blue, Colors.white];
    } else if (condition.contains('wind') ) {
      return [Colors.grey, Colors.white];
    } else if (condition.contains('thunderstorm') ) {
      return [Colors.yellow, Colors.white];
    } else if (condition.contains('foggy') ) {
      return [Colors.purple, Colors.white];
    } else {
      return [Colors.orange, Colors.white];
    }
  }
}
