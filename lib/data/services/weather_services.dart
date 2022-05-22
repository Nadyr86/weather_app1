import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app1/data/models/weather_model.dart';
import 'package:weather_app1/utils/constants/texts/app_texts.dart';

import 'package:weather_app1/utils/http/http_util.dart';

class WeatherService {
  Future<Map<String, dynamic>> getWeatherByLocation(
      {@required Position position}) async {
    final _url =
        '?&lat=${position.longitude}&lon=${position.latitude}&appid=${AppTexts.openWeatherApiKey}';

    return await HttpUtil.get(_url);
  }

  Future<Map<String, dynamic>> getWeatherByCity(String city) async {
    final _url = '?q=$city&appid=${AppTexts.openWeatherApiKey}';

    return await HttpUtil.get(_url);
  }

  Future<WeatherModel> getWeatherModelByLocation(Position position) async {
    final _data = await getWeatherByLocation(position: position);

    WeatherModel _weatherModel = WeatherModel.fromJson(_data);

    return _weatherModel;
  }

  Future<WeatherModel> getWeatherModelByCity(String city) async {
    final _data = await getWeatherByCity(city);

    WeatherModel _weatherModel = WeatherModel.fromJson(_data);

    return _weatherModel;
  }
}
