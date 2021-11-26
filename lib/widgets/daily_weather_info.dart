import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:test_weather_flutter_app/widgets/weather_row.dart';
import 'package:test_weather_flutter_app/api/models.dart';
import 'package:test_weather_flutter_app/constants.dart';
import 'package:intl/intl.dart';

class DailyWeatherInfo extends StatelessWidget {

  final WeatherList data;
  final DateFormat dateFormat = DateFormat.MMMMd('ru');
  final DateTime date;
  final List<bool> params;
  DailyWeatherInfo({Key key, this.data, this.params, this.date}) : super(key: key);

  String getWeatherIconPath(weather) {
    switch (weather) {
      case 'Clouds': {
        return 'assets/images/weather_state/states/cloudy.png';
      }
      case 'Clear': {
        return params[3] ? 'assets/images/weather_state/states/sun_dark.png': 'assets/images/weather_state/states/sun.png';
      }
      case 'Rain': {
        return params[3] ? 'assets/images/weather_state/states/rain_dark.png' : 'assets/images/weather_state/states/rain.png';
      }
      case 'Snow' : {
        return 'assets/images/weather_state/states/snowy.png';
      }
      default: {
        return 'assets/images/weather_state/states/partly_cloudy.png';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 390,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
                color: ThemeColors.black.withOpacity(0.2),
                blurRadius: 1
            ),
            BoxShadow(
              color: ThemeColors.background,
              spreadRadius: -12.0,
              blurRadius: 12.0,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0],
            colors: [
              ThemeColors.GradientColorStart,
              ThemeColors.GradientColorEnd,
            ],
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  dateFormat.format(date),
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Manrope',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.black
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0,),
            Row(
              children: [
                Image.asset(
                  getWeatherIconPath(data.weather[0].main),
                  width: 80.0,
                ),
              ],
            ),
            const SizedBox(height: 30.0,),
            Row(
              children: [
                WeatherRow(
                    image: 'assets/images/main_weather_info/thermometer.png',
                    text: '${params[0] ? data.temp.min : (data.temp.min * 9/5 + 32).toStringAsFixed(1)}${params[0] ? '˚C' : '˚F'}'),
              ],
            ),
            const Divider(
              height: 25.0,
              thickness: 0.0,
              color: Colors.transparent,
            ),
            Row(
              children: [
                WeatherRow(
                    image: 'assets/images/main_weather_info/breeze.png',
                    text: '${(params[1] ? data.speed: (data.speed * 3.6).toStringAsFixed(1))}${params[1] ? 'м/с' : 'км/ч'}'),
              ],
            ),
            const Divider(
              height: 25.0,
              thickness: 0.0,
              color: Colors.transparent,
            ),
            Row(
              children: [
                WeatherRow(
                    image: 'assets/images/main_weather_info/humidity.png',
                    text:'${data.humidity}%'),
              ],
            ),
            const Divider(
              height: 25.0,
              thickness: 0.0,
              color: Colors.transparent,
            ),
            Row(
              children: [
                WeatherRow(
                    image: 'assets/images/main_weather_info/barometer.png',
                    text: '${data.pressure} ${params[2] ? 'мм.рт.ст' : 'Па'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }


}



