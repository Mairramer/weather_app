import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wheater_app/src/models/wheater_model.dart';

class WeatherRepository {
  static const String API_ID = "fc31e3b9b792bf8d75d15b16334f2e25";

  Future<WeatherModel> getWeather(String city) async {
    final response = await http.Client().get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&lang=pt_br&appid=$API_ID"));
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    }
  }
}
