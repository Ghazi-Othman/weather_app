import 'package:get/get.dart';
import 'package:weather_app/model/weathermodel.dart';
import 'package:weather_app/service/apidata.dart';

class HomeController extends GetxController {
  WeatherData? weatherdata;
  String city = 'homs';
  @override
  void onInit() {
    super.onInit();
    getWeatherData(city);
  }

  void refsh() {
    weatherdata = null;
    getWeatherData(city);
    update();
  }

  void getWeatherData(String s) async {
    weatherdata = (await ApiData(city: s).getWeatherData());
    update();
  }

  void changeCity(String s) {
    weatherdata = null;
    getWeatherData(s);
    update();
  }
}
