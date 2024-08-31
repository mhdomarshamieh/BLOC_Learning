part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}

final class WeatherLoading extends WeatherState {}
