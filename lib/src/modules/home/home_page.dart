import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheater_app/src/core/consts/app_text_styles.dart';
import 'package:wheater_app/src/core/consts/images_const.dart';
import 'package:get/get.dart';

import 'bloc/weather_bloc.dart';
import 'bloc/weather_event.dart';
import 'bloc/weather_state.dart';
import 'widgets/show_weather.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherIsNotSearched) {
                return Container(
                  padding: EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Search Weather",
                        style: AppTextStyles.titleText,
                      ),
                      Text(
                        "Instantly",
                        style: AppTextStyles.titleText2,
                      ),
                      Container(
                        height: 150,
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.red,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              style: BorderStyle.solid,
                            ),
                          ),
                          hintText: 'cidade'.tr,
                          hintStyle: AppTextStyles.whiteText,
                        ),
                        style: AppTextStyles.whiteText,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  new RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {
                            if (cityController.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(new SnackBar(
                                content: Text('add_cidade'.tr),
                                action: SnackBarAction(
                                    label: "Ok",
                                    onPressed: ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar),
                              ));
                            } else {
                              weatherBloc
                                  .add(FetchWeather(cityController.text));
                            }
                          },
                          child: Text(
                            'buscar'.tr,
                            style: AppTextStyles.searchText,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is WeatherIsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherIsLoaded) {
                return ShowWeather(state.getWeather, cityController.text);
              } else {
                return Column(
                  children: <Widget>[
                    Text(
                      'erro'.tr,
                      style: AppTextStyles.searchError,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            new RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        BlocProvider.of<WeatherBloc>(context)
                            .add(ResetWeather());
                      },
                      child: Text(
                        'tente_novamente'.tr,
                        style: AppTextStyles.tryAgain,
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
