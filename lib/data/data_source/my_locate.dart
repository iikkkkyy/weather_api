import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  // Record
  Future<(double, double)> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return (position.latitude, position.longitude);
  }
}
