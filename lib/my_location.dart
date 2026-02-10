import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class MyLocation extends StatefulWidget {
  const MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  Position? _currentLocation;
  StreamSubscription ? _locationSubcriber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle:  true,
        title: Text('My Location',style: TextStyle(
          fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black
        ),),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 90,),
          SizedBox(
            height: 70,
            width: 300,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8)
              ),
              color: Colors.blue,
              child:   Text('My Current Location : $_currentLocation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
            ),
          ),
            const SizedBox(height: 20,),
            FilledButton(onPressed: (){
              _getCurrentLocation();
            }, child: Text('Listen My Location')),
            FilledButton(onPressed: (){
              _listenCurrentLocation();
            }, child: Text('Get My Location'))
          ],
        ),
      ),
    );
  }



  Future<void> _getCurrentLocation() async {
    //Check location permission by user ?
    _handleLocation(isSuccess: () async {
      // finally get currentLocation
      Position position = await Geolocator.getCurrentPosition();
      print(position);
      _currentLocation = position;
      setState(() {

      });
    },
    );
  }




  Future<void> _listenCurrentLocation() async {
   _handleLocation(isSuccess: (){
       // finally get currentLocation
       _locationSubcriber=Geolocator.getPositionStream(
       locationSettings: LocationSettings(
       accuracy: LocationAccuracy.best,
       distanceFilter: 2,
       timeLimit: Duration(seconds: 10)
   )).listen((position){
    print(position);
    _currentLocation=position;
    setState(() {});
    });
  },
    );
  }



  Future<void> _handleLocation({required VoidCallback isSuccess}) async {
    //Check location permission by user ?
    final LocationPermission locationPermission=await Geolocator.checkPermission();
    if(_ispermission(locationPermission)){

    }else {
      // if not, request permission
      LocationPermission permission=await Geolocator.requestPermission();
      if(_ispermission(permission)){
        _getCurrentLocation();
      }
    }

    // gps service enabled?
    final bool gpsEnabled= await Geolocator.isLocationServiceEnabled();
    if(gpsEnabled){
      // finally get currentLocation
     isSuccess();
    }else{
      await Geolocator.openLocationSettings();
    }
  }




  bool _ispermission(LocationPermission locationPermission){
    return locationPermission==LocationPermission.whileInUse || locationPermission==LocationPermission.always;

  }
  @override
  void dispose() {
    _locationSubcriber?.cancel();
    super.dispose();
  }

}
