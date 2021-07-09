import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wheater_app/src/core/consts/translations/app_translations.dart';
import 'package:wheater_app/src/modules/home/bloc/weather_bloc.dart';

import 'package:wheater_app/src/modules/home/home_page.dart';
import 'package:wheater_app/src/repositories/wheater_repository.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        locale: Get.deviceLocale,
        translationsKeys: AppTranslation.translations,
        home: Scaffold(
          body: BlocProvider(
            create: (context) => WeatherBloc(WeatherRepository()),
            child: HomePage(),
          ),
        ));
  }
}
