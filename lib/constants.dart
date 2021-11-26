// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';

class Constants {
  static const String WEATHER_APP_ID = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const String WEATHER_BASE_SCHEME = 'https://';
  static const String WEATHER_BASE_URL_DOMAIN = 'api.openweathermap.org';
  static const String WEATHER_FORECAST_PATH = '/data/2.5/forecast/daily';
  static const String WEATHER = '/data/2.5/forecast/';
  static const String WEATHER_IMAGES_PATH = '/img/w/';
  static const String WEATHER_IMAGES_URL = WEATHER_BASE_SCHEME + WEATHER_BASE_URL_DOMAIN + WEATHER_IMAGES_PATH;
}

class ThemeColors {
  static Color background = const Color(0xFFE2EBFF);
  static Color preview = const Color(0xFFE0E9FD);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0x0fffffff);
  static Color GradientColorStart = const Color(0xFFCDDAF5);
  static Color GradientColorEnd = const Color(0xFF9CBCFF);
  static Color menuUpButtons = const Color(0xFF0256FF);
  static Color ToWeekButtonColor = const Color(0xFF0256FF);
}

class ThemeImages {
  static AssetImage background = const AssetImage("assets/images/light.png");
}
