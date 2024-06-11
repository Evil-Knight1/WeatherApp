import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Field'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) async {
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityName: value);
                Navigator.of(context).pop();
              },
              onChanged: (value) {
                print(value);
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                border: OutlineInputBorder(),
                hintText: 'Enter your City',
                suffixIcon: Icon(Icons.search),
                labelText: 'Search Field',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
