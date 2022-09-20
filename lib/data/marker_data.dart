import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Marker> markers = [
  Marker(
    markerId: const MarkerId('PollokPark Cricket Club'),
    position: const LatLng(55.827727, -4.304017),
    infoWindow: const InfoWindow(title: 'PollokPark Cricket Club'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId('Titwood Tennis Club'),
    position: const LatLng(55.83829102800709, -4.283675332254232),
    infoWindow: const InfoWindow(title: 'Titwood Tennis Club'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId('PollokPark Football Club'),
    position: const LatLng(55.82387801316353, -4.287316700127477),
    infoWindow: const InfoWindow(title: 'PollokPark Football Club'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId('Indoor Bowling Club'),
    position: const LatLng(55.82890838031138, -4.260758629156186),
    infoWindow: const InfoWindow(title: 'Indoor Bowling Club'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId('Glasgow Archers'),
    position: const LatLng(55.83330288543334, -4.29707415679459),
    infoWindow: const InfoWindow(title: 'Glasgow Archers'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId('Hillhead BookClub'),
    position: const LatLng(55.87710738974595, -4.2906079400782735),
    infoWindow: const InfoWindow(title: 'Hillhead BookClub'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
];
