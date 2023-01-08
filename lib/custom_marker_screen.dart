import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class CustomMarkerScreen extends StatefulWidget {
  const CustomMarkerScreen({Key? key}) : super(key: key);

  @override
  State<CustomMarkerScreen> createState() => _CustomMarkerScreenState();
}

class _CustomMarkerScreenState extends State<CustomMarkerScreen> {
  final Completer<GoogleMapController> _controller=Completer();
  List<String> images=["- assets/car.png",
     " - assets/car_c.png",
"      - assets/home.png",
"      - assets/location.png",
"      - assets/map-pin.png",
"      - assets/motorbike.png",
      "- assets/taxi.png",];
  List<Marker> _markers=<Marker>[
    Marker(markerId: MarkerId("1"),position: LatLng(34.1688, 73.2215)),
    Marker(markerId: MarkerId("2"), position: LatLng(34.3313,73.1980)),
    Marker(markerId: MarkerId("3"), position: LatLng(33.9946,72.9106)),
    Marker(markerId: MarkerId("4"), position: LatLng(34.8883,72.6003)),
    Marker(markerId: MarkerId("5"), position: LatLng(35.2738, 73.2249)),
    Marker(markerId: MarkerId("6"), position: LatLng(33.5889,71.4429)),
    Marker(markerId: MarkerId("7"), position: LatLng(34.1971 , 73.2326)),
  ];
  List<LatLng> _latlng=<LatLng>[
    LatLng(34.1688, 73.2215),LatLng(34.3313,73.1980),
    LatLng(33.9946,72.9106),LatLng(34.8883,72.6003),
    LatLng(35.2738, 73.2249),LatLng(33.5889,71.4429),
    LatLng(34.1971 , 73.2326),


  ];
  static const CameraPosition KCamera=CameraPosition
    (target:LatLng(35.2738, 73.2249),
  zoom: 14.453);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  LoadData(){
    for(int i=0; i<images.length; i++)
      {
       _markers.add(Marker(markerId: MarkerId(i.toString()),
       position: _latlng[i],
       infoWindow: InfoWindow(title: "My First Custom Marker"),icon:
       BitmapDescriptor.defaultMarker),);
       _markers.add(Marker(markerId: MarkerId(i.toString()),
       position: _latlng[i],infoWindow: InfoWindow(title: "My second Marker"),
       icon: BitmapDescriptor.defaultMarker),);
       _markers.add(Marker(markerId: MarkerId(i.toString(),),position: _latlng[i],
       infoWindow: InfoWindow(title: "My third Marker"),icon: BitmapDescriptor.defaultMarker
       ),);
       _markers.add(Marker(markerId: MarkerId(i.toString()),position: _latlng[i],
       infoWindow: InfoWindow(title: "My fourth Marker"),
       icon: BitmapDescriptor.defaultMarker),);
      _markers.add( Marker(markerId: MarkerId(i.toString()),position: _latlng[i],
           infoWindow: InfoWindow(title: "My fifth Marker"),

      icon: BitmapDescriptor.defaultMarker),);
      _markers.add(Marker(markerId: MarkerId(i.toString()),position: _latlng[i],
      infoWindow: InfoWindow(title: "My Sisth Marker"),
      icon: BitmapDescriptor.defaultMarker),
      );
      _markers.add(Marker(markerId: MarkerId(i.toString()),position: _latlng[i],
      infoWindow: InfoWindow(title: "My seventh marker"),icon:
      BitmapDescriptor.defaultMarker),);
      setState(() {

      });


      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: KCamera,
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
