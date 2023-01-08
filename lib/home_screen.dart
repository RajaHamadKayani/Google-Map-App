import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller=Completer();
  static final CameraPosition KCamera=const CameraPosition(
      target:LatLng(34.1688, 73.2215),);

  List<Marker> marker=[];
  final List<Marker> list=const [
    Marker
      (markerId: MarkerId("1"),
    position: LatLng(34.1688, 73.2215),
    infoWindow: InfoWindow(
      title: "My live location"
    )),
    Marker
      (markerId: MarkerId("2"),
    position: LatLng(34.3313,73.1980),
    infoWindow: InfoWindow(
      title: "My first Location"
    )),
    Marker
      (markerId: MarkerId("3"),
    position: LatLng(33.9946,72.9106),
    infoWindow: InfoWindow(
      title: "My second location"
    )),
    Marker(markerId: MarkerId("4"),
    position: LatLng(34.8883,72.6003),
    infoWindow: InfoWindow(
      title: "Sangla location"
    )),
    Marker
      (markerId:MarkerId("5"),
    position: LatLng(35.2738, 73.2249),
    infoWindow: InfoWindow(
      title: "Kohistani's village"
    )),
    Marker(markerId: MarkerId("6"),
    position: LatLng(33.5889,71.4429),
    infoWindow: InfoWindow(
      title: "Daniyal village"
    ),
    ),
    Marker
      (markerId: MarkerId("7"),
    position: LatLng(34.1971 , 73.2326),
    infoWindow: InfoWindow(
      title: "Hamad's current Location"
    ),),
    Marker
      (markerId:MarkerId("9"),
    position: LatLng(39.9042 , 116.4074 ),
    infoWindow: InfoWindow(
      title: "Beijing China"
    ),),
    Marker
      (markerId: MarkerId("10"),
    position: LatLng(33.8688, 151.2093),
    infoWindow: InfoWindow(
      title: "Sydney Australia",
    ),),
   Marker
     (markerId:MarkerId("11"),
   position: LatLng(39.3999, 8.2245),
   infoWindow: InfoWindow(
     title: "Portugal Location",
   ),),

  ];
  void initState()
  {
    super.initState();
    marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child:  GoogleMap(

          initialCameraPosition: KCamera,
          mapType: MapType.normal,
          markers: Set<Marker>.of(marker),
          myLocationEnabled: true,
          compassEnabled: true,

          onMapCreated: (GoogleMapController controller){

            _controller.complete(controller);


          },
          gestureRecognizers:const{

          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: ()async{
         GoogleMapController controller=await _controller.future;
         controller.animateCamera(CameraUpdate.
         newCameraPosition(CameraPosition
           (target: LatLng(39.3999, 8.2245),
           zoom: 14.45,)

         ));
          setState(() {

          });
        },
      ),


    );
  }
}
