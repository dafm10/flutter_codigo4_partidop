import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  CameraPosition cameraPosition = CameraPosition(
    zoom: 15,
    target: LatLng(
      -12.094833,
      -77.023038,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bases Moradas"),
      ),
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController _controller){
          _controller.setMapStyle(json.encode(mapStyle));
        },
      ),
    );
  }
}
