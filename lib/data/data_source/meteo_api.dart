import 'dart:convert';
import '../dto/meteo_dto.dart';
import 'package:http/http.dart' as http;

class MeteoApi {
  Future<MeteoDto> getWeatherResult(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?daily=temperature_2m_max,temperature_2m_min,weathercode&latitude=$latitude&longitude=$longitude'));
    return MeteoDto.fromJson(jsonDecode(response.body));
  }
}
