import 'package:geolocator/geolocator.dart';

class Location {
  double latitide = 0.0;
  double longitude = 0.0;
  Future getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //nothing
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitide = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
