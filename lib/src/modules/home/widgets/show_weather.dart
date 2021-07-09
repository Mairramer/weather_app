import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheater_app/src/core/consts/app_text_styles.dart';
import 'package:wheater_app/src/models/wheater_model.dart';
import 'package:wheater_app/src/modules/home/bloc/weather_bloc.dart';
import 'package:wheater_app/src/modules/home/bloc/weather_event.dart';
import 'package:wheater_app/src/modules/home/widgets/temperature_info.dart';
import 'package:wheater_app/src/modules/home/widgets/weather_infos.dart';

// ignore: must_be_immutable
class ShowWeather extends StatefulWidget {
  WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  _ShowWeatherState createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  @override
  Widget build(BuildContext context) {
    String iconUrl =
        'http://openweathermap.org/img/wn/${widget.weather.weather![0].icon}@2x.png';
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: <Widget>[
          Text(
            widget.city,
            style: AppTextStyles.cityText,
          ),
          Image.network(iconUrl),
          Text(
            widget.weather.weather![0].description.toString(),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          TemperatureInfo(
              temperature:
                  widget.weather.main!.temp!.round().toString() + " °C",
              temperatureInfo: 'neste_momento'.tr,
              styleTemp: AppTextStyles.temperatureText,
              styleTempInfo: AppTextStyles.temperatureInfo),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TemperatureInfo(
                temperature:
                    widget.weather.main!.tempMin!.round().toString() + " °C",
                temperatureInfo: 'minima'.tr,
                styleTemp: AppTextStyles.temperatureText,
                styleTempInfo: AppTextStyles.temperatureInfo,
              ),
              TemperatureInfo(
                  temperature:
                      widget.weather.main!.tempMax!.round().toString() + " °C",
                  temperatureInfo: 'maxima'.tr,
                  styleTemp: AppTextStyles.temperatureText,
                  styleTempInfo: AppTextStyles.temperatureInfo),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeaherInfos(
                  infoText: 'umidade'.tr,
                  styleInfoText: TextStyle(color: Colors.white),
                  dataInfo: widget.weather.main!.humidity.toString() + '%',
                  dataInfoStyle: TextStyle(color: Colors.white)),
              WeaherInfos(
                  infoText: 'pressao'.tr,
                  styleInfoText: TextStyle(color: Colors.white),
                  dataInfo: widget.weather.main!.pressure.toString() + 'hPa',
                  dataInfoStyle: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeaherInfos(
                  infoText: 'sensacao'.tr,
                  styleInfoText: TextStyle(color: Colors.white),
                  dataInfo: widget.weather.main!.feelsLike.toString() + '°C',
                  dataInfoStyle: TextStyle(color: Colors.white)),
              WeaherInfos(
                  infoText: 'visibilidade'.tr,
                  styleInfoText: TextStyle(color: Colors.white),
                  dataInfo: widget.weather.visibility.toString() + 'Km',
                  dataInfoStyle: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeaherInfos(
                  infoText: 'vento'.tr,
                  styleInfoText: TextStyle(color: Colors.white),
                  dataInfo: widget.weather.wind!.speed.toString() + 'Km/h',
                  dataInfoStyle: TextStyle(color: Colors.white)),
              WeaherInfos(
                  infoText: 'nuvem'.tr,
                  styleInfoText: TextStyle(color: Colors.white),
                  dataInfo: widget.weather.clouds!.all.toString() + '%',
                  dataInfoStyle: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(
            height: 110,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
              onPressed: () {
                BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
              },
              child: Text(
                'buscar_novamente'.tr,
                style: AppTextStyles.searchText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
