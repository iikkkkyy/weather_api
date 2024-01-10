import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:provider/provider.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
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
        create: (BuildContext context) => MainViewModel()..getWeatherInfo(),
        child: WeatherScreen(),
      ),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access MainViewModel using Provider
    final viewModel = context.watch<MainViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('주간 날씨'), // Adjust as needed
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 날짜 + 요일 표시
                    '${viewModel.timeList?[index] ?? ''} (${viewModel.getDayOfWeek(index)})',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10),
                  // Max, Min 온도 표시
                  Text('최고기온: ${viewModel.maxTempList?[index] ?? ''} °C'),
                  Text('최저기온: ${viewModel.minTempList?[index] ?? ''} °C'),
                  const SizedBox(height: 10),
                  // 날씨 코드 표시
                  Text('날씨: ${_getWeatherCondition(viewModel.weatherCodeList?[index] ?? 0)}'),
                  _getWeatherIcon(viewModel.weatherCodeList?[index] ?? 0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
String _getWeatherCondition(int weatherCode) {
  switch (weatherCode) {
    case 51:
      return '가벼운 이슬비';
    case 3:
      return '구름 많음';
  // 다른 날씨 코드에 대한 처리를 추가할 수 있습니다.
    default:
      return '기타 날씨';
  }
}

Icon _getWeatherIcon(int weatherCode) {
  switch (weatherCode) {
    case 51:
      return Icon(Typicons.weather_shower);
    case 3:
      return Icon(Typicons.weather_cloudy);
  // 다른 날씨 코드에 대한 처리를 추가할 수 있습니다.
    default:
      return Icon(Typicons.weather_night);
  }
}