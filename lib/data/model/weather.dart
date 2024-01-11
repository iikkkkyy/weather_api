class Weather {
  List<String> time = [];
  List<num> maxTemp = [];
  List<num> minTemp = [];
  List<int> weatherCode = [];

  Weather({
    required this.time,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weather &&
          runtimeType == other.runtimeType &&
          time == other.time &&
          maxTemp == other.maxTemp &&
          minTemp == other.minTemp &&
          weatherCode == other.weatherCode);

  @override
  int get hashCode =>
      time.hashCode ^
      maxTemp.hashCode ^
      minTemp.hashCode ^
      weatherCode.hashCode;

  @override
  String toString() {
    return 'Weather{ time: $time, maxTemp: $maxTemp, minTemp: $minTemp, weatherCode: $weatherCode,}';
  }

  Weather copyWith({
    List<String>? time,
    List<num>? maxTemp,
    List<num>? minTemp,
    List<int>? weatherCode,
  }) {
    return Weather(
      time: time ?? this.time,
      maxTemp: maxTemp ?? this.maxTemp,
      minTemp: minTemp ?? this.minTemp,
      weatherCode: weatherCode ?? this.weatherCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'weatherCode': weatherCode,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      time: map['time'] as List<String>,
      maxTemp: map['maxTemp'] as List<num>,
      minTemp: map['minTemp'] as List<num>,
      weatherCode: map['weatherCode'] as List<int>,
    );
  }

//</editor-fold>
}
