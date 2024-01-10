import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/ui/main/main_screen.dart';
import 'package:weather_api/ui/main/main_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => MainViewModel()..getWeatherInfo(), // 초기화
        child: WeatherScreen(),
      ),
    );
  }
}