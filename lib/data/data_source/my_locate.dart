import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getCurrentLocation() async {

    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}