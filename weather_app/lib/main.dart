import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: getWeatherTheme(BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.condition),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

ThemeData getWeatherTheme(String? condition) {
  if (condition == null) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
    );
  } else {
    switch (condition) {
      case 'Sunny':
      case 'Clear':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      case 'Partly cloudy':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlueAccent,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      case 'Cloudy':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.grey,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      case 'Overcast':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            brightness: Brightness.dark,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          useMaterial3: true,
        );
      case 'Mist':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlueAccent,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      case 'Patchy rain possible':
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      case 'Patchy snow possible':
      case 'Light snow':
      case 'Patchy light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
      case 'Blizzard':
      case 'Blowing snow':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      case 'Thundery outbreaks possible':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          useMaterial3: true,
        );
      case 'Fog':
      case 'Freezing fog':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.grey,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
      default: // Default theme
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
          useMaterial3: true,
        );
    }
  }
}
