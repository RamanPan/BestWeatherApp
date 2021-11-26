import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:test_weather_flutter_app/api/models.dart';
import 'package:test_weather_flutter_app/constants.dart';


class WeatherApi {

  Future<WeatherDailyForecast> fetchWeatherForecast(String city) async {
    var params = {
      'appid':Constants.WEATHER_APP_ID,
      'units':'metric',
      'q':city
    };


    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, params);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    // ignore: avoid_print
    print('response: ${response.body}');


    params = {
      'cnt' : '8',
      'appid':Constants.WEATHER_APP_ID,
      'units':'metric',
      'q':city
    };


    uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER, params);
    log('request: ${uri.toString()}');

    var response2 = await http.get(uri);

    // ignore: avoid_print
    print('response: ${response.body}');

    if (response.statusCode == 200) {
      List<Weather> weatherforhour = [];
      List list =  json.decode(response2.body)['list'];
      // print(list);
      for (int i = 0; i < list.length; i++){
        weatherforhour.add(Weather.fromJson(list[i]['weather'][0]));
      }
      return WeatherDailyForecast.fromJsonandList(json.decode(response.body), weatherforhour);
    }
    else {
      return Future.error('Error response');
    }
  }
}
