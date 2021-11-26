import 'package:flutter/material.dart';
import 'package:test_weather_flutter_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loading.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<String> cities = [];

  Future<void> initPrefs() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      cities = storage.getStringList('favoritecities') ?? [];
    });
  }

  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
    initPrefs();
  }

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
          'Избранные',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontFamily: 'Manrope',
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: ThemeColors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: ThemeColors.background),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ListView.separated(
            itemCount: cities.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              String word = cities[index];

              return Container(
                decoration: BoxDecoration(
                    color: ThemeColors.background,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        spreadRadius: -6.0,
                        blurRadius: 12.0,
                      ),
                    ]),
                child: ListTile(
                  title: Text(word, style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Manrope',
                      color: ThemeColors.black),),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: ThemeColors.black,
                    ),
                    onPressed: () async {
                      SharedPreferences storage = await SharedPreferences.getInstance();
                      setState(() {
                        cities.removeAt(index);
                      });
                      storage.setStringList('favoritecities', cities);
                    },
                  ),
                  onTap: () async {
                    SharedPreferences storage = await SharedPreferences.getInstance();
                    storage.setString('activeCity', cities.elementAt(index));
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                          return const Loading();}), (route) => false);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}