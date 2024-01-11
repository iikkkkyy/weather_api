import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/data/data_source/my_locate.dart';
import 'package:weather_api/data/repository/weather_repository.dart';
import 'package:weather_api/data/repository/weather_repository_impl.dart';

import '../../data/model/weather.dart';

final class MainViewModel extends ChangeNotifier  {
  final _repository = WeatherRepositoryImpl();


  List<String> _timeList = [];
  List<num> _maxTempList = [];
  List<num> _minTempList = [];
  List<int> _weatherCodeList = [];

  List<String> get timeList => _timeList;
  List<num> get maxTempList => _maxTempList;
  List<num> get minTempList => _minTempList;
  List<int> get weatherCodeList => _weatherCodeList;

  MyLocation myLocation =  MyLocation();

  Future<void> getWeatherInfo() async {
    final (double latitude, double longitude) = await myLocation.getCurrentLocation();
    Weather weather = await _repository.getWeatherItems(latitude, longitude);
    _timeList = weather.time;
    _maxTempList = weather.maxTemp;
    _minTempList = weather.minTemp;
    _weatherCodeList = weather.weatherCode;
    notifyListeners();
  }

  String getDayOfWeek(int index) {
    // 날짜를 YYYY-MM-DD 형식으로 변환
    DateTime date = DateTime.parse(_timeList[index]);
    // 요일을 가져옴
    String dayOfWeek = DateFormat('EEEE').format(date);
    return dayOfWeek;
  }
}