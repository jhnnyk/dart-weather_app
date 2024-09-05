void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Syntax: dart bin/main.dart <city>');
  }

  final city = arguments.first;
  print(city);
}