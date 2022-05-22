import 'package:geolocator/geolocator.dart';
import 'package:weather_app1/data/models/weather_model.dart';
import 'package:weather_app1/data/services/weather_services.dart';
import 'package:weather_app1/utils/di/di_locator.dart';

class WeatherRepozitory {
  Future<WeatherModel> getWeatherModelByLocation(Position position) async {
    return await getIt<WeatherService>().getWeatherModelByLocation(position);
  }

  Future<WeatherModel> getWeatherModelByCity(String city) async {
    return await getIt<WeatherService>().getWeatherModelByCity(city);
  }
}
