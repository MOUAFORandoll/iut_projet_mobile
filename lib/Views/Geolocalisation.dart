import 'package:Fahkap/components/Button/app_button.dart';
import 'package:Fahkap/components/Button/themeButton.dart';
import 'package:Fahkap/components/Widget/app_back_button.dart';
import 'package:Fahkap/components/Widget/app_input.dart';
import 'package:Fahkap/components/Widget/app_title_right.dart';
import 'package:Fahkap/controller/MyController.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:Fahkap/utils/Services/validators.dart';
import 'package:Fahkap/utils/constants/assets.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:Fahkap/utils/Services/routing.dart';
import 'package:get/get.dart';

class Geolocalisation extends StatelessWidget {
  Geolocalisation({required this.lat, required this.long});
  var lat = 0.0;
  var long = 0.0;
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    Marker _salle = Marker(
        markerId: MarkerId('0'),
        draggable: false,
        infoWindow: InfoWindow(
          title: "Voici la classe",
        ),
        onTap: () {
          //print('this is where you will arrive');
        },
        position: LatLng(lat, long));

    return GetBuilder<MyController>(builder: (_controller) {
      var _initialCameraPosition = CameraPosition(
        target: LatLng((_controller.latitude + lat) / 2,
            (_controller.longitude + long) / 2),
        zoom: 15.0,
      );
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Suivez la Carte'),
              leading: AppBackButton()),
          body: Stack(alignment: Alignment.center, children: [
            Container(
                height: 800,
                margin: EdgeInsets.only(right: 5),
                child: GoogleMap(
                  // myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  // on below line setting compass enabled.
                  compassEnabled: true,
                  // trafficEnabled: true,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (controller) {
                    mapController = controller;
                  },

                  markers: {_salle},
                ))
          ]));
    });
  }
}
