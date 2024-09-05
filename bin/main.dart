import 'weather_api_client.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Syntax: dart bin/main.dart <city>');
  }

  final city = arguments.first;
  final api = WeatherApiClient();
  final locationId = await api.getLocationId(city);
  print(locationId);
}
