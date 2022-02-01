import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/models/bases_model.dart';
import 'package:flutter_codigo4_partidop/services/api_services.dart';
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
  APIService _apiService = APIService();
  List<BasesModel> listBases = [];

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
    zoom: 5,
    target: LatLng(
      -12.094833,
      -77.023038,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getMarkers();
    _apiService.getListbases().then((value) {
      listBases = value;
      listBases.forEach((element) {
        MarkerId _markerId = MarkerId(_markers.length.toString());
        Marker _marker = Marker(
            markerId: _markerId,
            position: LatLng(element.latitud, element.longitud),
            onTap: () {
              showDialogMarker(element);
            });
        _markers[_markerId] = _marker;
      });
      setState(() {});
    });
  }

  void getMarkersBases() {}

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

  void showDialogMarker(BasesModel location) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double _width = MediaQuery.of(context).size.width;
        double _height = MediaQuery.of(context).size.height;

        return AlertDialog(
          contentPadding: const EdgeInsets.all(0.0),
          titlePadding: const EdgeInsets.all(0.0),
          insetPadding: const EdgeInsets.all(0.0),
          actionsPadding: const EdgeInsets.all(0.0),
          buttonPadding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          content: Container(
            constraints: BoxConstraints(
              maxWidth: _width * 0.7,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: _height * 0.2,
                  width: _width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14.0),
                      topRight: Radius.circular(14.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(location.imagen),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                  child: Text(
                    location.base,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: COLOR_BRAND_PRIMARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                  child: Text(
                    "${location.distrito} - ${location.region}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                  child: Text(
                    location.direccion,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                      fontSize: 13.0,
                    ),
                  ),
                ),
                SizedBox(height: _height * 0.015),
              ],
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
                children:
                  listBases.map<Widget>((e) => ItemListLocationWidget(basesModel: e,)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
