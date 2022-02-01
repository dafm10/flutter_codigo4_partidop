import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_codigo4_partidop/ui/widgets/item_list_location_widget.dart';
import 'package:flutter_codigo4_partidop/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Map<MarkerId, Marker> _markers = {};
  List myLocation = [
    {
      "latitude": -8.0527962,
      "longitude": -79.0546765,
      "text": "Marcador 1",
    },
    {
      "latitude": -12.094795,
      "longitude": -77.023262,
      "text": "Marcador 2",
    },
    {
      "latitude": -11.999568,
      "longitude": -77.056496,
      "text": "Marcador 3",
    }
  ];

  CameraPosition cameraPosition = CameraPosition(
    zoom: 10,
    target: LatLng(
      -12.094833,
      -77.023038,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarkers();
  }

  void getMarkers() {
    myLocation.forEach((element) {
      MarkerId _markerId = MarkerId(_markers.length.toString());
      Marker _marker = Marker(
          markerId: _markerId,
          position: LatLng(element["latitude"], element["longitude"]),
          onTap: () {
            showDialogMarker(element["text"]);
          });
      _markers[_markerId] = _marker;
    });
    setState(() {});
  }

  void showDialogMarker(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            text,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bases Moradas"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: cameraPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController _controller) {
              _controller.setMapStyle(json.encode(mapStyle));
            },
            /*onTap: (LatLng position){
          //print(position);
          MarkerId _markerId = MarkerId(myLocation.length.toString());
          Marker _marker = Marker(
            markerId: _markerId,
            position: position,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
            draggable: true,

            onDragEnd: (LatLng newPosition){
            }
          );
          _markers[_markerId] = _marker;
          setState(() {

          });
        },*/
            markers: _markers.values.toSet(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  ItemListLocationWidget(),
                  ItemListLocationWidget(),
                  ItemListLocationWidget(),
                  ItemListLocationWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
