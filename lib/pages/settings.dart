// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:test_weather_flutter_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loading.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<bool> tempCustom = [true, false];
  List<bool> windCustom = [true, false];
  List<bool> pressureCustom = [true, false];
  List<bool> themeCustom = [true, false];

  Future<void> initSettings() async {
    SharedPreferences folder = await SharedPreferences.getInstance();
    setState(() {
      bool temp = folder.getBool('tempCustom');
      bool wind = folder.getBool('windCustom');
      bool pa = folder.getBool('pressureCustom');
      if (temp != null) {tempCustom = [temp, !temp];}
      if (wind != null) {windCustom = [wind, !wind];}
      if (pa != null) {pressureCustom = [pa, !pa];}
    });
  }

  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
    initSettings();
  }

  Widget createSetting(
      name, attrName, attrList, valuesNamesList) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontFamily: 'Manrope',
              color: ThemeColors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ),
        Container(
          height: 25.0,
          decoration: BoxDecoration(
            color: ThemeColors.background,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 9), // changes position of shadow
              ),
            ],
          ),
          child:
          ToggleButtons(
            children: <Widget>[
              SizedBox(
                width: 65.0,
                child: Center(
                  child: Text(
                    valuesNamesList[0],
                    style:
                    const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600, fontSize: 12.0),
                  ),
                ),
              ),
              SizedBox(
                width: 65.0,
                child: Center(
                  child: Text(
                    valuesNamesList[1],
                    style:
                    const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600, fontSize: 12.0),
                  ),
                ),
              ),
            ],
            isSelected: attrList,
            borderRadius: BorderRadius.circular(15.0),
            color: ThemeColors.black,
            selectedColor: Colors.white,
            fillColor: const Color(0x4B5F8888),
            onPressed: (int index) async {
              SharedPreferences storage = await SharedPreferences.getInstance();
              setState(() {
                if (index == 0) {
                  attrList[index] = !attrList[index];
                  attrList[1] = !attrList[1];
                }
                else {
                  attrList[index] = !attrList[index];
                  attrList[0] = !attrList[0];
                }
              });
              storage.setBool(attrName, attrList[0]);
            }
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return const Loading();}), (route) => false);
            // Navigator.pop(context);
            },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        iconTheme: IconThemeData(
          color: ThemeColors.black,
        ),
        title: Text(
          'Настройки',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontFamily: 'Manrope',
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: ThemeColors.black,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          color: ThemeColors.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: Row(
                  children: const [
                    Text(
                      'Единицы измерения',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Manrope',
                          color: Color(0xFF828282),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                width: 375.0,
                decoration: BoxDecoration(
                  color: ThemeColors.background,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 9,
                      offset: const Offset(0, 9), // changes position of shadow
                    ),
                    BoxShadow(
                      color: ThemeColors.black,
                    ),
                    BoxShadow(
                      color: ThemeColors.background,
                      spreadRadius: -12.0,
                      blurRadius: 12.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      createSetting(
                          'Температура',
                          "tempCustom",
                          tempCustom,
                          ['˚C', '˚F']),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: Colors.black.withOpacity(.15),
                      ),
                      createSetting(
                          'Сила ветра',
                          "windCustom",
                          windCustom,
                          ['м/с', 'км/ч']),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: Colors.black.withOpacity(.15),
                      ),
                      createSetting(
                          'Давление',
                          "pressureCustom",
                          pressureCustom,
                          ['мм.рт.ст.', 'гПа']),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
