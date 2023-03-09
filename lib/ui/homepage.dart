// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/quakemodel.dart';
import 'package:flutter_application_2/network/network.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Quake> _quakesData;
  final List<Marker> _markerList = <Marker>[];
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _quakesData = Network().getAllQuakes();
    // _quakesData.then((value) =>
    //     // ignore: avoid_print
    //     print('Place: ${value.features[0].geometry.coordinates[0]}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [_buildGoogleMap(context)]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          findQuakes();
        },
        label: const Text('Find Quakes'),
      ),
    );
  }

  void findQuakes() {
    setState(() {
      _markerList.clear(); //clear the map in the beginning
      _handleResponse();
    });
  }

  void _handleResponse() {
    setState(() {
      _quakesData.then((quakes) => {
           
            quakes.features.forEach((quake) {
              _markerList.add(
                Marker(
                    markerId: MarkerId(quake.id),
                    infoWindow: InfoWindow(
                        title: quake.properties.mag.toString(),
                        snippet: quake.properties.title),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure),
                    position: LatLng(quake.geometry.coordinates[1],
                        quake.geometry.coordinates[0]),
                    onTap: () {}),
              );
            })
          });
    });
  }

  Widget _buildGoogleMap(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        markers: Set<Marker>.of(_markerList),
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
            target: LatLng(
              36.1083333,
              -177.8608333,
            ),
            zoom: 3),
        onMapCreated: (GoogleMapController controller) =>
            _controller.complete(controller),
      ),
    );
  }
}
