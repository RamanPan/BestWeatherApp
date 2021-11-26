import 'package:flutter/material.dart';
import 'package:test_weather_flutter_app/pages/loading.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Loading(),
    );
  }
}