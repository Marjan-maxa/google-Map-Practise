import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GoogleMapScreeen extends StatefulWidget {
  const GoogleMapScreeen({super.key});

  @override
  State<GoogleMapScreeen> createState() => _GoogleMapScreeenState();
}

class _GoogleMapScreeenState extends State<GoogleMapScreeen> {
  late final GoogleMapController _googleMapController;
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
            ),
          onMapCreated: (GoogleMapController controller ){
            _googleMapController=controller;
          },
          onTap: (LatLng latLng){
            print(latLng);
          },
          markers: <Marker>{
            Marker(
                markerId: MarkerId('DIU Varsity'),
              position: LatLng(23.793922900088496, 90.44714469571997),
              onTap: (){
                  print('Tapped in my campus');
              },
              visible: true,
              icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
              infoWindow: InfoWindow(
                title: 'Diu Campus'
              )
            ),
            Marker(
                markerId: MarkerId('Home'),
                position: LatLng(23.792621561342752, 90.44608891010284),
                onTap: (){
                  print('Tapped in my home');
                },
                visible: true,
                icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                infoWindow: InfoWindow(
                    title: 'Home'
                )
            ),

            Marker(
                markerId: MarkerId('Office'),
                position: LatLng(23.793545277320902, 90.44399611651897),
                onTap: (){
                  print('Tapped in my home');
                },
                visible: true,
                icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
                infoWindow: InfoWindow(
                    title: 'Office-1'
                )
            )
          },
          polylines: <Polyline>{
            Polyline(
                polylineId:PolylineId('Diu Campus to Office-1'),
              points:[
                LatLng(23.793922900088496, 90.44714469571997),
                LatLng(23.792621561342752, 90.44608891010284),
                LatLng(23.793545277320902, 90.44399611651897)


              ],
              visible: true,
              color: Colors.red,
              width: 8,
              endCap: Cap.roundCap,
              startCap: Cap.buttCap,
              jointType: JointType.round
            ),
            Polyline(
                polylineId:PolylineId('Office-1 to Diu'),
                points:[
                  LatLng(23.793545277320902, 90.44399611651897),
                  LatLng(23.793922900088496, 90.44714469571997),



                ],
                visible: true,
                color: Colors.green,
                width: 8,
                endCap: Cap.roundCap,
                startCap: Cap.buttCap,
                jointType: JointType.round
            ),



          },
          circles: <Circle>{
            Circle(
                circleId: CircleId('green zone'),
              center: LatLng(23.793922900088496, 90.44714469571997),
              radius: 100,
              strokeWidth: 4,
              strokeColor: Colors.red,
              fillColor: Colors.pink.withAlpha(30),
              onTap: (){
                  print('University Tap event');
              },
              consumeTapEvents: false

            ),

          },
          polygons: <Polygon>{
            Polygon(
                polygonId: PolygonId('random plygon'),
              points: [
                LatLng(23.791705201608103, 90.44464118778706),
                LatLng(23.791029355320187, 90.446882173419),
                LatLng(23.789495112912398, 90.44522691518068),
                LatLng(23.788903008919327, 90.44475484639406),

              ],
              strokeWidth: 5,
              strokeColor: Colors.green,
              fillColor: Colors.pink.withAlpha(50),
              onTap: (){
                  print('on tap random polygon');
              },
              consumeTapEvents: true
            )
          },
        ),
      ),
      floatingActionButton:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: (){
            _googleMapController.animateCamera
              (
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: LatLng(23.793922900088496, 90.44714469571997),
                    zoom: 17
                  ),
                ),
            );

          },child: Icon(Icons.my_location),),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
