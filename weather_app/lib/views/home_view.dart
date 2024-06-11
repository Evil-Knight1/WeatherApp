import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/no_weather.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/weather.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 10,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: SearchField()); //search field
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return state is WeatherInitialState
              ? const NoWeather()
              : state is WeatherLoadedState
                  ? WeatherScreen(
                      weatherModel: state.weatherModel!,
                    )
                  : const Center(
                      child: Text(
                        'Error loading weather',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
