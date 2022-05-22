import 'package:flutter/material.dart';
import 'package:weather_app1/data/models/weather_model.dart';
import 'package:weather_app1/data/repozitory/geolocation_repozitory.dart';
import 'package:weather_app1/data/repozitory/weather_repozitory.dart';

import 'package:weather_app1/presentation/view/city_view.dart';
import 'package:weather_app1/presentation/view/weather_page_content.dart';
import 'package:weather_app1/presentation/widgets/container_with_bg_image.dart';
import 'package:weather_app1/presentation/widgets/custom_progress_indicator.dart';
import 'package:weather_app1/utils/di/di_locator.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key key}) : super(key: key);

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  bool _isLoading = false;

  WeatherModel _weatherModel;

  @override
  void initState() {
    showWeatherByLocation();
    super.initState();
  }

  Future<void> showWeatherByLocation() async {
    setState(() {
      _isLoading = true;
    });
    final _position = await getIt<GeolocationRepozitory>().getCurrentPosition();
    _weatherModel =
        await getIt<WeatherRepozitory>().getWeatherModelByLocation(_position);

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getWeatherByCity(String _city) async {
    setState(() {
      _isLoading = true;
    });
    _weatherModel =
        await getIt<WeatherRepozitory>().getWeatherModelByCity(_city);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () async {
              await showWeatherByLocation();
            },
            icon: const Icon(
              Icons.navigation,
              size: 40,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final _typedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityView(),
                ),
              );
              await getWeatherByCity(_typedCity);
            },
            icon: const Icon(
              Icons.location_city,
              size: 40,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: ContainerWithBgImage(
        child: _isLoading
            ? const CustomProgressIndicator()
            : WeatherPageContent(
                celcius: _weatherModel.celcius,
                icon: _weatherModel.icon,
                description: _weatherModel.description,
                cityName: _weatherModel.cityName,
              ),
      ),
    );
  }
}
