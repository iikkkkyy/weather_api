class MeteoDto {
  double? latitude;
  double? longitude;
  double? generationTimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  DailyUnits? dailyUnits;
  Daily? daily;

  MeteoDto.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationTimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    dailyUnits = json['daily_units'] != null ? DailyUnits.fromJson(json['daily_units']) : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
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
    data['daily_units'] = dailyUnits != null ? dailyUnits!.toJson() : null;
    data['daily'] = daily != null ? daily!.toJson() : null;
    return data;
  }
}

class DailyUnits {
  String? time;
  String? temperature2mMax;
  String? temperature2mMin;
  String? weatherCode;

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2mMax = json['temperature_2m_max'];
    temperature2mMin = json['temperature_2m_min'];
    weatherCode = json['weathercode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time'] = time;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['weathercode'] = weatherCode;
    return data;
  }
}

class Daily {
  List<String>? time;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<int>? weatherCode;

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time']?.cast<String>();
    temperature2mMax = json['temperature_2m_max']?.cast<double>();
    temperature2mMin = json['temperature_2m_min']?.cast<double>();
    weatherCode = json['weathercode']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time'] = time;
    data['temperature_2m_max'] = temperature2mMax;
    data['temperature_2m_min'] = temperature2mMin;
    data['weathercode'] = weatherCode;
    return data;
  }
}
