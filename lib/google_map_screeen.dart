import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GoogleMapScreeen extends StatefulWidget {
  const GoogleMapScreeen({super.key});

  @override
  State<GoogleMapScreeen> createState() => _GoogleMapScreeenState();
}

class _GoogleMapScreeenState extends State<GoogleMapScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: GoogleMap(
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
            scrollGesturesEnabled:true,
          myLocationEnabled: true,
          mapType: MapType.normal,
            trafficEnabled: true,
            initialCameraPosition: CameraPosition(target:
            LatLng(23.793922900088496, 90.44714469571997),
              zoom: 17
            )
        ),
      ),
    );
  }
}
