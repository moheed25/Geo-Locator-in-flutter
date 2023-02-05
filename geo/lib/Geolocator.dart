import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocator extends StatefulWidget {
  const GeoLocator({super.key});

  @override
  State<GeoLocator> createState() => _GeoLocatorState();
}

class _GeoLocatorState extends State<GeoLocator> {
  void getCurrentPosition() async {
    // Premission :
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission not Given ");
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("Longitude :" + currentPosition.longitude.toString());
      print("Latitude :" + currentPosition.latitude.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GeoLocation ',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  getCurrentPosition();
                },
                child: Text(
                  'Get curent Location',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                )),
          )
        ],
      ),
    ));
  }
}
