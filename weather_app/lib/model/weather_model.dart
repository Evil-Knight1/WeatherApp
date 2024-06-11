class WeatherModel {
  final double temp, minTemp, maxTemp;
  final String condition, cityName, image;
  final DateTime date;
  const WeatherModel(
      {required this.cityName,
      required this.image,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.condition});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      image: json['current']['condition']['icon'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['current']['temp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
