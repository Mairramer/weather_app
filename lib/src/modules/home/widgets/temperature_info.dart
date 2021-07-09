import 'package:flutter/material.dart';

class TemperatureInfo extends StatelessWidget {
  final String temperature;
  final String temperatureInfo;
  final TextStyle styleTemp;
  final TextStyle styleTempInfo;

  const TemperatureInfo({
    Key? key,
    required this.temperature,
    required this.temperatureInfo,
    required this.styleTemp,
    required this.styleTempInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          temperature,
          style: styleTemp,
        ),
        Text(
          temperatureInfo,
          style: styleTempInfo,
        )
      ],
    );
  }
}
