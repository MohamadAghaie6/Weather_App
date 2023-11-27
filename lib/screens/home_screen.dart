import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/constant/constants.dart';

import '../data/my_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  String cityName = 'Tehran';
  String continent = 'Asia';
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName(cityName).then((value) {
      setState(() {
        _weather = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getBuildUi(),
    );
  }

  Widget getBuildUi() {
    if (_weather == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return getContent(context);
  }

  Widget getContent(BuildContext context) {
    //Tehran latitude//35.715298;
    //Tehran longitude//51.404343;
    WeatherInformation myWeatherEzpz = WeatherInformation(
      _weather,
      cityName,
      continent,
      longitude: 51.404343,
      latitude: 35.715298,
    );

    return Stack(
      children: [
        //Purple circle right
        Align(
          alignment: AlignmentDirectional(2, -0.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: purpleColor,
            ),
          ),
        ),
        //Puple circle Left
        Align(
          alignment: AlignmentDirectional(-2, -0.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: purpleColor,
            ),
          ),
        ),
        //Orange top Container
        Align(
          alignment: AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 330,
            decoration: BoxDecoration(
              color: orangeColor,
            ),
          ),
        ),
        //Blur Effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
        // The CONTENT
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 60, right: 8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Hey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '📍${myWeatherEzpz.Location()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Image.asset(
                        myWeatherEzpz.getWeatherIcon(),
                        scale: 1.3,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${myWeatherEzpz.Temperature()}° C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    myWeatherEzpz.Description().toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Center(
                  child: Text(
                    '${myWeatherEzpz.CurrentTime('Day')}  -  ${myWeatherEzpz.CurrentTime('Time')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/11.png',
                          scale: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sunrise',
                              style: TextStyle(
                                color: Colors.grey,
                                //fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${myWeatherEzpz.Sunrise()}',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/12.png',
                          scale: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sunset',
                              style: TextStyle(
                                color: Colors.grey,
                                //fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${myWeatherEzpz.Sunset()}',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.5,
                    horizontal: 30,
                  ),
                  child: Divider(
                    color: Colors.white24,
                    height: 4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/13.png',
                          scale: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Temp max',
                              style: TextStyle(
                                color: Colors.grey,
                                //fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${myWeatherEzpz.MaxTemp()}° C',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/14.png',
                          scale: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Temp min',
                              style: TextStyle(
                                color: Colors.grey,
                                //fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${myWeatherEzpz.MinTemp()}° C',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
