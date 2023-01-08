import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({Key? key}) : super(key: key);

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {
  Completer<GoogleMapController> _controller=Completer();
  static final CameraPosition KCamera=const CameraPosition(
    target:LatLng(34.1688, 73.2215),);

  List<Marker> marker=[];
  final List<Marker> list= [
  Marker
    (markerId: MarkerId("1"),
      position: LatLng(34.1688, 73.2215),
      infoWindow: InfoWindow(
          title: "My live location"
      )),
  ];
  LoadData()
  {

    getUserCurrentLocation().then((value)async{
      print("My current Location");
      print(value.latitude.toString()+" "+value.longitude.toString());
      marker.add(
          Marker(markerId: MarkerId("2"),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: InfoWindow(
                title: "My Current Location",
              ))
      );
      CameraPosition cameraPosition=CameraPosition
        (target:LatLng(value.latitude, value.longitude),
          zoom: 14.454);

      final GoogleMapController controller=await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      setState(() {

      });

    });


  }
  Future<Position> getUserCurrentLocation() async
  {
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      print("Error:"+ error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
  @override
  initstate()
  {
   super.initState();
   LoadData();
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
       onPressed: ()async{


       },
        child: Icon(Icons.local_activity),
      ),


    );
  }
}
