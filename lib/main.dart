import 'package:flutter/material.dart';
import 'package:weather_app1/presentation/view/weather_view.dart';
import 'package:weather_app1/utils/di/di_locator.dart';

void main() {
  initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: const WeatherView(),
    );
  }
}
  