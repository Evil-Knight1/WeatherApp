import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final dio = Dio();
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      const String baseUrl = 'http://api.weatherapi.com/v1';
      const String apiKey = '7b8dd267bbf74c8aa7f125530242005';
      final Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'ops there was an error try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('ops there was an error try later');
    }
  }
}
