// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:test_weather_flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_weather_flutter_app/api/daily_weather.dart';
import 'package:test_weather_flutter_app/pages/search_from_loading.dart';
import 'mainpage.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String currentCity;
  bool darkTheme = false;

  Future<void> getLocationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecast(currentCity);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MainPage(locationWeather: weatherInfo);
      }));
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const SearchfromLoading();
      }));
    }
  }

  Future<void> initPrefs() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    currentCity = storage.getString('activeCity') ?? 'Санкт-Петербург';
    if (storage.getBool('themeCustom')!= null) {darkTheme = storage.getBool('themeCustom');}

    if (darkTheme) {
      ThemeColors.black = Colors.white;
      ThemeColors.white = Colors.black;
      ThemeColors.background = const Color(0xFF0C172B);
      ThemeColors.preview = const Color(0xFF0D182C);
      ThemeColors.GradientColorStart = const Color(0xFF223B70);
      ThemeColors.GradientColorEnd = const Color(0xFF0F1F40);
      ThemeImages.background = const AssetImage("assets/images/dark.png");
      ThemeColors.ToWeekButtonColor = const Color(0xfffffffff);
      ThemeColors.menuUpButtons = const Color(0x051340);
    }
    else {
      ThemeColors.black = Colors.black;
      ThemeColors.white = Colors.white;
      ThemeColors.background = const Color(0xFFE2EBFF);
      ThemeColors.preview = const Color(0xFFE0E9FD);
      ThemeColors.GradientColorStart = const Color(0xFFCDDAF5);
      ThemeColors.GradientColorEnd = const Color(0xFF9CBCFF);
      ThemeColors.ToWeekButtonColor = const Color(0xFF0256FF);
      ThemeColors.menuUpButtons = const Color(0xFF0256FF);
      ThemeImages.background = const AssetImage("assets/images/light.png");
    }
  }

  void init() async {
    await initPrefs();
    getLocationData();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: ThemeColors.background
        ),
        child: Column(
          children: [
            const SizedBox(height: 120.0,),
            Center(
              child: Text(
                "Weather",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Manrope',
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.black
                ),
              ),
            ),
            const SizedBox(height: 120.0,),
            Image.asset('assets/images/loader.png', color: ThemeColors.ToWeekButtonColor,)
          ],
        ),
      ),
    );
  }
}