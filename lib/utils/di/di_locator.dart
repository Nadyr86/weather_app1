import 'package:get_it/get_it.dart';
import 'package:weather_app1/data/repozitory/geolocation_repozitory.dart';
import 'package:weather_app1/data/repozitory/weather_repozitory.dart';
import 'package:weather_app1/data/services/geo_location_service.dart';
import 'package:weather_app1/data/services/weather_services.dart';

final getIt = GetIt.instance;

void initDI() {
  _initRepozitories();
  _initServices();
}

void _initRepozitories() {
  getIt.registerSingleton<WeatherRepozitory>(WeatherRepozitory());
  getIt.registerSingleton<GeolocationRepozitory>(GeolocationRepozitory());
}

void _initServices() {
  getIt.registerSingleton<WeatherService>(WeatherService());
  getIt.registerSingleton<GeolocationService>(GeolocationService());
}
