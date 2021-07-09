import 'package:wheater_app/src/models/wheater_model.dart';

import 'weather_event.dart';

class WeatherState extends WeatherEvent {
  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final weather;

  WeatherIsLoaded(this.weather);

  WeatherModel get getWeather => weather;

  @override
  List<Object> get props => [weather];
}

class WeatherIsNotLoaded extends WeatherState {}
