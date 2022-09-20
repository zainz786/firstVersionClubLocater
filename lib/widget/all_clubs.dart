import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import './dynamic_map.dart';
import 'package:test2/data/club_data.dart';
import './club_details.dart';

class AllClubs extends StatefulWidget {
  const AllClubs({Key? key}) : super(key: key);

  @override
  State<AllClubs> createState() => _AllClubsState();
}

class _AllClubsState extends State<AllClubs> {
  Position? _currentUserPosition;
  double? distanceMeter = 0.0;

  Future _getDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    for (int counter = 0; counter < allClubsData.length; counter++) {
      double clubLat = allClubsData[counter].lat;
      double clubLong = allClubsData[counter].long;

      distanceMeter = await Geolocator.distanceBetween(
        _currentUserPosition!.latitude,
        _currentUserPosition!.longitude,
        clubLat,
        clubLong,
      );

      var distance = distanceMeter?.round().toDouble();
      allClubsData[counter].distance = (distance! / 1000);
      setState(() {});
    }
  }

  @override
  void initState() {
    _getDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text('Hobbygo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DynamicMap(),
            ),
          );
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.map_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: GridView.builder(
            itemCount: allClubsData.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisExtent: 200,
            ),
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ClubDetails(
                        club: allClubsData[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height * 0.6,
                  width: width * 0.3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.12,
                        width: width,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.network(
                            allClubsData[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        color: Colors.indigo,
                        child: Text(
                          allClubsData[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Colors.indigo,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on),
                            Text(
                              '${allClubsData[index].distance.round()} Km',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
