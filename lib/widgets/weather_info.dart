import 'package:flutter/material.dart';
import '../constants.dart';

class WeatherInfo extends StatelessWidget{

  final String image;
  final dynamic data;

  const WeatherInfo({Key key, this.image, this.data}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      // height: 122,
      decoration: BoxDecoration(
        color: ThemeColors.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            ]),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image),
            const VerticalDivider(
              width: 14.0,
              thickness: 0,
              color: Colors.transparent,
            ),
            Text(
              data,
              style: TextStyle(
                  fontSize: 17.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Manrope',
                  // fontWeight: FontWeight.w600,
                  color: ThemeColors.black
              ),
            )
          ],
        ),
      ),
    );
  }

}