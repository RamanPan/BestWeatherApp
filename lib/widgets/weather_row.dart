import 'package:flutter/material.dart';
import '../constants.dart';

class WeatherRow extends StatelessWidget {

  final String image;
  final String text;

  const WeatherRow({Key key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 25.0, height: 25.0, child: Image.asset(image)),
        const VerticalDivider(
          width: 14.0,
          thickness: 0,
          color: Colors.transparent,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontFamily: 'Manrope',
              color: ThemeColors.black
          ),
        )
      ],
    );
  }
}