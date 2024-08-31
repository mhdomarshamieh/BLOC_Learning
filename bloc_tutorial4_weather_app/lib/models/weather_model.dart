import 'package:flutter/foundation.dart';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double windSpeed;
  final int currentHumidity;

//<editor-fold desc="Data Methods">

  const WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.windSpeed,
    required this.currentHumidity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherModel &&
          runtimeType == other.runtimeType &&
          currentTemp == other.currentTemp &&
          currentSky == other.currentSky &&
          currentPressure == other.currentPressure &&
          windSpeed == other.windSpeed &&
          currentHumidity == other.currentHumidity);

  @override
  int get hashCode =>
      currentTemp.hashCode ^
      currentSky.hashCode ^
      currentPressure.hashCode ^
      windSpeed.hashCode ^
      currentHumidity.hashCode;

  @override
  String toString() {
    return 'WeatherModel{' +
        ' currentTemp: $currentTemp,' +
        ' currentSky: $currentSky,' +
        ' currentPressure: $currentPressure,' +
        ' windSpeed: $windSpeed,' +
        ' currentHumidity: $currentHumidity,' +
        '}';
  }

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    int? currentPressure,
    double? windSpeed,
    int? currentHumidity,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      windSpeed: windSpeed ?? this.windSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': this.currentTemp,
      'currentSky': this.currentSky,
      'currentPressure': this.currentPressure,
      'windSpeed': this.windSpeed,
      'currentHumidity': this.currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    if (kDebugMode) print('hello');
    return WeatherModel(
      currentTemp: currentWeatherData['main']['temp'],
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      windSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

/*

    //</editor-fold>
  *       final data = snapshot.data!;

          final currentWeatherData = data['list'][0];

          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];
          final currentHumidity = currentWeatherData['main']['humidity'];
  * */
}
