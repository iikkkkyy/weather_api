import 'package:weather_api/data/data_source/meteo_api.dart';
import 'package:weather_api/data/model/weather.dart';
import 'package:weather_api/data/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final _api = MeteoApi();

  @override
  Future<Weather> getWeatherItems(double latitude, double longitude) async {
    final dto = await _api.getWeatherResult(latitude, longitude);

    // null처리...

    Weather resultLists = Weather(
      time: dto.daily!.time!,
      maxTemp: dto.daily!.temperature2mMax!,
      minTemp: dto.daily!.temperature2mMin!,
      weatherCode: dto.daily!.weatherCode!,
    );
    return resultLists;
  }
}
