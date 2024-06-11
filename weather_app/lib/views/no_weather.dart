import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "You haven't search for any town yet",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
