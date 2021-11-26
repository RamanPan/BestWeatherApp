import 'package:flutter/material.dart';
import 'package:test_weather_flutter_app/constants.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        iconTheme: IconThemeData(
          color: ThemeColors.black,
        ),
        elevation: 0.0,
        title: Text(
          'О разработчике',
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            color: ThemeColors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ThemeColors.background,
          boxShadow: [BoxShadow(
            color: ThemeColors.black,
          ),
            BoxShadow(
              color: ThemeColors.background,
              spreadRadius: -12.0,
              blurRadius: 12.0,
            ),]
        ),
        child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Container (
                            height: 50,
                            width: 240,
                            decoration: BoxDecoration(
                                color: ThemeColors.background,
                                boxShadow: [
                                  BoxShadow(
                                  color: ThemeColors.black,
                                ),
                                  BoxShadow(
                                    color: ThemeColors.black,
                                    spreadRadius: -12.0,
                                    blurRadius: 12.0,
                                  ),],
                                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                        child:Center(
                        child: Text(
                          "Test Weather app",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Manrope',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w800,
                              color: ThemeColors.black)))),
                        )),
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ThemeColors.background,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0)),
                          boxShadow: [
                            BoxShadow(
                                color: ThemeColors.black.withOpacity(0.07),
                                spreadRadius: 12.0,
                                blurRadius: 12.0)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "by Vitoliot",
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Manrope',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800,
                                          color: ThemeColors.black
                                      ),
                                    ),
                                    const Text(
                                      "Версия 1.0",
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Manrope',
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF4A4A4A)
                                      ),
                                    ),
                                    const Text(
                                      "от 08.11.2021",
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Manrope',
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF4A4A4A)
                                      ),
                                    )
                                  ],
                                ),
                                const Text(
                                  "2021",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Manrope',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF4A4A4A)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}