// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_weather_flutter_app/api/models.dart';
import 'package:test_weather_flutter_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_weather_flutter_app/widgets/daily_weather_info.dart';

class WeatherAppWeek extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final locationDailyWeather;
  const WeatherAppWeek({Key key, this.locationDailyWeather}) : super(key: key);

  @override
  _WeatherAppWeekState createState() => _WeatherAppWeekState();
}

class _WeatherAppWeekState extends State<WeatherAppWeek> {
  Future<WeatherDailyForecast> dailydata;

  bool isC = true;
  bool isMpS = true;
  bool isMm = true;
  bool isDark = false;

  Future<void> initPrefs() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      bool C = storage.getBool('tempCustom');
      bool MpS = storage.getBool('windCustom');
      bool Mm = storage.getBool('pressureCustom');
      bool Dark = storage.getBool('themeCustom');
      if (C != null) {isC = C;}
      if (MpS != null) {isMpS = MpS;}
      if (Mm != null)  {isMm = Mm;}
      if (Dark != null)  {isDark = Dark;}
    });
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
    if (widget.locationDailyWeather != null) {
      dailydata = Future.value(widget.locationDailyWeather);
    }
    initializeDateFormatting();
  }


  @override
  Widget build(BuildContext context) {
    // args = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      body: Container(
        color: ThemeColors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 20.0),
          child:
          Column(
            children: [
              Center(
                child: Text(
                  "Прогноз на неделю",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Manrope',
                      fontSize: 24.0, fontWeight: FontWeight.w600, color: ThemeColors.black),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              FutureBuilder<WeatherDailyForecast> (
              future : dailydata,
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return Container(
                      height: 408,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        DailyWeatherInfo(date: DateTime.now(), data: snapshot.data.list[0], params: [isC, isMpS, isMm, isDark]),
                        DailyWeatherInfo(date: DateTime.now().add(const Duration(days: 1)), data: snapshot.data.list[1], params: [isC, isMpS, isMm, isDark]),
                        DailyWeatherInfo(date: DateTime.now().add(const Duration(days: 2)), data: snapshot.data.list[2], params: [isC, isMpS, isMm, isDark]),
                        DailyWeatherInfo(date: DateTime.now().add(const Duration(days: 3)), data: snapshot.data.list[3], params: [isC, isMpS, isMm, isDark]),
                        DailyWeatherInfo(date: DateTime.now().add(const Duration(days: 4)), data: snapshot.data.list[4], params: [isC, isMpS, isMm, isDark]),
                        DailyWeatherInfo(date: DateTime.now().add(const Duration(days: 5)), data: snapshot.data.list[5], params: [isC, isMpS, isMm, isDark]),
                        DailyWeatherInfo(date: DateTime.now().add(const Duration(days: 6)), data: snapshot.data.list[6], params: [isC, isMpS, isMm, isDark]),
                ])
                );
                }
                else {return Text("Данные не получены",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Manrope',
                        fontSize: 24.0, fontWeight: FontWeight.w600, color: ThemeColors.black));}}
                    ),
              const SizedBox(height: 40.0,),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return ThemeColors.white;
                        }
                        return ThemeColors.background;
                      }),
                  overlayColor:
                  MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.transparent;
                      }),
                  side: MaterialStateProperty.resolveWith((states) {
                    Color _borderColor;
                    if (states.contains(MaterialState.pressed)) {
                      _borderColor = Colors.white;
                    }
                    _borderColor = Colors.blue;

                    return BorderSide(color: _borderColor, width: 1);
                  }),
                  shape: MaterialStateProperty.resolveWith<
                      OutlinedBorder>((_) {
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10));
                  }),
                ),
                child: Text("Назад на главную", style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Manrope',
                    color: ThemeColors.ToWeekButtonColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}