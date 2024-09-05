import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/api';

  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    final locationResponse = await http.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('Error getting locationId for city: $city');
    }
    final locationJson = jsonDecode(locationResponse.body) as List;
    return locationJson.first['woeid'] as int;
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('Error getting weather for location: $locationId');
    }
    print(weatherResponse.body);
    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getWeather(String city) async {
    final locationId = await getLocationId(city);
    return fetchWeather(locationId);
  }
}
