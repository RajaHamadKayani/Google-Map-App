import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GetCurrentLocation extends StatefulWidget {
  const GetCurrentLocation({Key? key}) : super(key: key);

  @override
  State<GetCurrentLocation> createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
 Completer<GoogleMapController> _controller=Completer();
 final  CameraPosition cameraPosition=CameraPosition
   (target:LatLng(13.7563, 100.5018) );

 List<Marker> marker=[];
 List<Marker> list=[
   Marker
     (markerId:MarkerId("1"),
   infoWindow: InfoWindow(title: "My Current Location"),
   )
 ];

 LoadData()
 {


 }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
