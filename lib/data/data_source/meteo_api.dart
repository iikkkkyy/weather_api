import 'dart:convert';
import '../dto/meteo_dto.dart';
import 'package:http/http.dart' as http;

class MeteoApi {
  Future<MeteoDto> getWeatherResult(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl&latitude=$latitude&longitude=$longitude'));
    return MeteoDto.fromJson(jsonDecode(response.body));
  }
}
