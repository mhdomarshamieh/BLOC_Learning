import 'package:bloc_tutorial4_weather_app/bloc/weather_bloc.dart';
import 'package:bloc_tutorial4_weather_app/data/data_provider/weather_data_provider.dart';
import 'package:bloc_tutorial4_weather_app/data/repository/weather_repository.dart';
import 'package:bloc_tutorial4_weather_app/presentation/screens/wether_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) {
        return WeatherRepository(WeatherDataProvider());
      },
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
