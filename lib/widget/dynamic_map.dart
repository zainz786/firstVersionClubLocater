import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

import 'package:test2/data/club_data.dart';
import '../data/marker_data.dart';

class DynamicMap extends StatefulWidget {
  const DynamicMap({Key? key}) : super(key: key);

  @override
  State<DynamicMap> createState() => _DynamicMap();
}

class _DynamicMap extends State<DynamicMap> {
  Completer<GoogleMapController> _controller = Completer();
  Position? _mapUserPosition;
  late double mapInitialLat;
  late double mapInitialLong;
  double? distanceMeter = 0.0;
  ClubData clubData = ClubData();
  List<Marker> locations = markers;

  Future _getLocation() async {
    _mapUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      mapInitialLat = _mapUserPosition!.latitude;
      mapInitialLong = _mapUserPosition!.longitude;
    });
  }

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Map View'),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(mapInitialLat, mapInitialLong),
                zoom: 12,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: locations.map((e) => e).toSet(),
            ),
          ),
        ));
  }
}
