
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
class ConvertLatLngToAddress extends StatefulWidget {
  const ConvertLatLngToAddress({Key? key}) : super(key: key);

  @override
  State<ConvertLatLngToAddress> createState() => _ConvertLatLngToAddressState();
}

class _ConvertLatLngToAddressState extends State<ConvertLatLngToAddress> {
  String stAddress="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle:true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          GestureDetector(
           onTap: ()async{
             final coordinates=new Coordinates(33.8688, 151.2093);
             var address=await Geocoder.local.findAddressesFromCoordinates(coordinates);
             var first=address.first;
             print("Address:"+first.featureName.toString()+first.addressLine.toString());

             final query="Mandian abbottabad Kpk Pakistan";
             var address1=await Geocoder.local.findAddressesFromQuery(query);
              var second=address1.first;
              print("Adress:"+first.featureName.toString()+ first.coordinates.toString());
              setState(() {
                stAddress=first.addressLine.toString();
                stAddress=first.coordinates.toString();
              });
           },
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.black54),
                child: Center(
                  child: Text("Convert"),
                ),
              ),
            ),

      ),





        ],
      )
    );
  }
}
