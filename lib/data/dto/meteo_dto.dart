class MeteoDto {
  double? latitude;
  double? longitude;
  double? generationTimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  MeteoDto.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationTimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null;
    hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationTimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    data['hourly_units'] = hourlyUnits != null ? hourlyUnits!.toJson() : null;
    data['hourly'] = hourly != null ? hourly!.toJson() : null;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? weatherCode;
  String? relativeHumidity2m;
  String? windSpeed10m;
  String? pressureMsl;

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    weatherCode = json['weathercode'];
    relativeHumidity2m = json['relativehumidity_2m'];
    windSpeed10m = json['windspeed_10m'];
    pressureMsl = json['pressure_msl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['weathercode'] = weatherCode;
    data['relativehumidity_2m'] = relativeHumidity2m;
    data['windspeed_10m'] = windSpeed10m;
    data['pressure_msl'] = pressureMsl;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<int>? weatherCode;
  List<int>? relativeHumidity2m;
  List<double>? windSpeed10m;
  List<double>? pressureMsl;

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time']?.cast<String>();
    temperature2m = json['temperature_2m']?.cast<double>();
    weatherCode = json['weathercode']?.cast<int>();
    relativeHumidity2m = json['relativehumidity_2m']?.cast<int>();
    windSpeed10m = json['windspeed_10m']?.cast<double>();
    pressureMsl = json['pressure_msl']?.cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['weathercode'] = weatherCode;
    data['relativehumidity_2m'] = relativeHumidity2m;
    data['windspeed_10m'] = windSpeed10m;
    data['pressure_msl'] = pressureMsl;
    return data;
  }
}
