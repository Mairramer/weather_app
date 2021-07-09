import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheater_app/src/models/wheater_model.dart';

import 'package:wheater_app/src/repositories/weather_repository.dart';

import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherIsNotSearched());

  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();
      try {
        WeatherModel weatherModel =
            await weatherRepository.getWeather(event.city);
        yield WeatherIsLoaded(weatherModel);
      } catch (Exception) {
        yield WeatherIsNotLoaded();
      }
    } else if (event is ResetWeather) {
      yield WeatherIsNotSearched();
    }
  }
}
