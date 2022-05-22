// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather_app1/data/services/geo_location_service.dart';
// import 'package:weather_app1/data/services/weather_services.dart';
// import 'package:weather_app1/presentation/view/city_view.dart';
// import 'package:weather_app1/presentation/view/weather_page_content.dart';
// import 'package:weather_app1/utils/weather/utils/weather_util.dart';
// import 'package:weather_app1/presentation/widgets/container_with_bg_image.dart';
// import 'package:weather_app1/presentation/widgets/custom_progress_indicator.dart';

// class WeatherApp extends StatefulWidget {
//   const WeatherApp({Key key}) : super(key: key);

//   @override
//   _WeatherAppState createState() => _WeatherAppState();
// }

// class _WeatherAppState extends State<WeatherApp> {
//   String _celcius = '';
//   String _cityName = '';
//   String _icon;
//   String _description = 'echpala jok';
//   bool _isLoading = false;

//   @override
//   void initState() {
//     showWeatherByLocation();

//     super.initState();
//   }

//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   showWeatherByLocation();
//   // }

//   Future<void> showWeatherByLocation() async {
//     setState(() {
//       _isLoading = true;
//     });

//     // await Future.delayed(Duration(seconds: 2));
//     final position = await GeolocationService().getCurrentPosition();

//     await getWeatherByLocation(position: position);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: IconButton(
//             onPressed: () async {
//               await showWeatherByLocation();
//             },
//             icon: const Icon(
//               Icons.navigation,
//               size: 40,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               final _typedCity = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CityView(),
//                 ),
//               );
//               await getWeatherByCity(_typedCity);
//             },
//             icon: const Icon(
//               Icons.location_city,
//               size: 40,
//             ),
//           ),
//           const SizedBox(
//             width: 15,
//           )
//         ],
//       ),
//       body: ContainerWithBgImage(
//         child: Center(
//           child: _isLoading
//               ? const CustomProgressIndicator()
//               : WeatherPageContent(
//                   size: _size,
//                   celcius: _celcius,
//                   icon: _icon,
//                   cityName: _cityName,
//                   description: _description),
//         ),
//       ),
//     );
//   }

//   Future<void> getWeatherByLocation({Position position}) async {
//     setState(() {
//       _isLoading = true;
//     });
//     final _data =
//         await WeatherService().getWeatherByLocation(position: position);

//     _cityName = _data['name'];

//     final kelvin = _data['main']['temp'] as num;
//     _celcius = WeatherUtil.kelvinToCelcius(kelvin);
//     _icon = WeatherUtil.getWeatherIcon(kelvin.toInt());

//     // _celcius = (kelvin - 273.15).round().toString();

//     _description = WeatherUtil.getDescription(int.parse(_celcius));

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   Future<void> getWeatherByCity(typedCity) async {
//     setState(() {
//       _isLoading = true;
//     });

//     final _data = await WeatherService().getWeatherByCity(typedCity);

//     _cityName = _data['name'];

//     final kelvin = _data['main']['temp'] as num;

//     _celcius = WeatherUtil.kelvinToCelcius(kelvin);
//     _icon = WeatherUtil.getWeatherIcon(kelvin.toInt());
//     _description = WeatherUtil.getDescription(int.parse(_celcius));

//     setState(() {
//       _isLoading = false;
//     });
//   }
// }
