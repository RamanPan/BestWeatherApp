import 'package:flutter/material.dart';
import 'package:test_weather_flutter_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loading.dart';
import 'mainpage.dart';

class SearchfromLoading extends StatefulWidget {
  const SearchfromLoading({Key key}) : super(key: key);

  @override
  _SearchfromLoadingState createState() =>
      _SearchfromLoadingState();
}

class _SearchfromLoadingState extends State<SearchfromLoading> {
  List<String> cities = [];
  Set<String> favoriteCities = <String>{};
  String city;
  Future<void> initPrefs() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    if (storage.getStringList('cities') == null) {
      storage.setStringList('cities', favoriteCities.toList());
    }
    setState(() {
      cities =
          (storage.getStringList('cities') ?? []);
      if (storage.getStringList('favoritecities') == null)
      {
      favoriteCities = <String>{};
      }
      else {favoriteCities = storage.getStringList('favoritecities').toSet();}
    });

  }

  final _controller = TextEditingController();


  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Container(
        color: ThemeColors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                    Container(
                      width: 350,
                        color: ThemeColors.background,
                        child:
                    TextField(
                    style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Manrope',
                    color: ThemeColors.black
                    ),
                    controller: _controller,
                    onEditingComplete: () {
                      cities.add(city);
                      setState(() async {
                      SharedPreferences storage = await SharedPreferences.getInstance();
                      storage.setStringList('cities', cities);
                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const SearchfromLoading();}));
                  }
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Введите город...',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Manrope',color: ThemeColors.black),
                  suffixIcon: IconButton(
                    onPressed: _controller.clear,
                    icon: const Icon(Icons.clear),
                    color: ThemeColors.black,
                  ),
                ),
                onChanged: (value) {
                  city = value;
                },
              )),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: cities.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    String word = cities[index];
                    bool isSaved = favoriteCities.contains(word);

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
                                icon: Icon(isSaved ? Icons.star : Icons.star_border),
                                color: ThemeColors.black,
                                onPressed: () async {
                                  setState(() {
                                    isSaved
                                        ? favoriteCities.remove(word)
                                        : favoriteCities.add(word);
                                  });
                                  SharedPreferences storage =
                                      await SharedPreferences.getInstance();
                                  storage.setStringList("favoritecities", favoriteCities.toList());
                                },),
                        onTap: () async {
                          SharedPreferences storage = await SharedPreferences.getInstance();
                           storage.setString('activeCity', cities.elementAt(index));
                            Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                              return const Loading();}), (route) => false);},
                        onLongPress: () async {
    setState(() {
          cities.remove(word);
        });
        SharedPreferences storage =
        await SharedPreferences.getInstance();
        storage.setStringList("cities", cities);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}