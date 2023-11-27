import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:suntime/suntime.dart';

// api key
final OPENWEATHER_API_KEY = "1f0be518ff7eec6453b0a94a40023108";
//

class WeatherInformation {
  var date = DateTime.now();
  Weather? weatherObject;
  String ctName;
  String continent;
  var longitude;
  var latitude;

  WeatherInformation(
    this.weatherObject,
    this.ctName,
    this.continent, {
    this.longitude,
    this.latitude,
  });

  String Location() {
    return weatherObject != null ? weatherObject!.areaName! : 'could not get';
  }

  // getting date&time infromation (Day,Year,Time)
  String CurrentTime(String action) {
    DateTime now = weatherObject!.date!;
    if (action == 'Day') {
      return DateFormat('EEEE').format(now);
    }
    if (action == 'Year') {
      return DateFormat("d.M.y").format(now);
    }
    if (action == 'Time') {
      return DateFormat('h.mm a').format(now);
    }
    return 'could not get';
  }

  String Description() {
    return weatherObject!.weatherDescription!;
  }

  String Temperature() {
    return weatherObject!.temperature!.celsius!.toStringAsFixed(0);
  }

  String MaxTemp() {
    return weatherObject!.tempMax!.celsius!.toStringAsFixed(0);
  }

  String MinTemp() {
    return weatherObject!.tempMin!.celsius!.toStringAsFixed(0);
  }

  String Sunrise() {
    var sun = Sun(latitude, longitude);

    var tzSunrise = sun.getLocalSunriseTime('$continent/$ctName', date: date);
    return DateFormat('h.mm a').format(tzSunrise);
  }

  String Sunset() {
    var sun = Sun(latitude, longitude);

    var tzSunset = sun.getLocalSunsetTime('$continent/$ctName', date: date);
    return DateFormat('h.mm a').format(tzSunset);
  }

  String getWeatherIcon() {
    if (weatherObject!.weatherDescription!.toString() == 'few clouds') {
      return 'assets/8.png';
    }
    if (weatherObject!.weatherDescription!.toString() == 'clear sky') {
      return 'assets/7.png';
    }
    if (weatherObject!.weatherDescription!.toString() == 'haze') {
      return 'assets/5.png';
    }
    if (weatherObject!.weatherDescription!.toString() == 'overcast clouds') {
      return 'assets/8.png';
    }
    if (weatherObject!.weatherDescription!.toString() == 'sunny') {
      return 'assets/6.png';
    }
    return 'assets/8.png';
  }
  
}
