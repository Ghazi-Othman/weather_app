import 'package:http/http.dart' as http;
import 'package:weather_app/model/weathermodel.dart';

class ApiData {
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather?";
  String endPoints = "&units=metric&appid=4afd590704ac71d9a85e9f0d49bbd6f2";
  String city = "homs";

  ApiData({required this.city});

  getWeatherData() async {
    try {
      var url = Uri.parse("${baseUrl}q=$city$endPoints");
      var response = (await http.get(url));

      if (response.statusCode == 200) {
        WeatherData weatherData = weatherDataFromJson(response.body);
        return weatherData;
      }
    } catch (e) {
      throw 'Something wrong : $e';
    }
    return null;
  }
}
