import 'package:geolocator/geolocator.dart';
import 'package:weather_app1/data/services/geo_location_service.dart';
import 'package:weather_app1/utils/di/di_locator.dart';

class GeolocationRepozitory {
  Future<Position> getCurrentPosition() async {
    return await getIt<GeolocationService>().getCurrentPosition();
  }
}
