import '../model/weather.dart';

abstract interface class WeatherRepository {
  Future<Weather> getWeatherItems(double latitude, double longitude);
}