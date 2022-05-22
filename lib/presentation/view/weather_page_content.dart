import 'package:flutter/material.dart';

class WeatherPageContent extends StatelessWidget {
  const WeatherPageContent({
    Key key,
    this.size,
    this.celcius,
    this.icon,
    this.cityName,
    this.description,
  }) : super(key: key);

  final Size size;
  final String celcius;
  final String icon;
  final String cityName;
  final String description;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: _size.height * 0.1,
        ),
        Text(
          celcius.isEmpty ? '0\u00B0' : '$celcius\u00B0 $icon',
          style: const TextStyle(
              fontSize: 94, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 25,
        ),
        cityName.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  cityName,
                  style: const TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          height: _size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            description,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
