import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit({initialStat}) : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService().getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState(errorMsg: e.toString()));
    }
  }
}
