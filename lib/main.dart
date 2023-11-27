import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';


void main() => runApp(Application());

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
