// ignore_for_file: unused_local_variable, unnecessary_null_comparison, unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapL extends StatefulWidget {
  MapL({super.key});

  @override
  State<MapL> createState() => _HomepageState();
}

class _HomepageState extends State<MapL> {
  Position? cl;
  var lat;
  var long;

  Future<bool> getper() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (!services) {
      print("Location services are disabled.");
      return false;
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.denied) {
        print("Location permissions are denied.");
        return false;
      }
    }
    if (per == LocationPermission.deniedForever) {
      print("Location permissions are permanently denied.");
      return false;
    }
    return true;
  }

  Future<void> getlandl() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl?.latitude;
    long = cl?.longitude;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getper().then((hasPermission) {
      if (hasPermission) {
        getlandl();
      }
    });
  }

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(21.485811, 39.192505);
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('lane1'),
      position: LatLng(21.461173, 39.231762),
      infoWindow: InfoWindow(
        title: 'Lane ',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: MarkerId('pothole1'),
      position: LatLng(21.457552, 39.223091),
      infoWindow: InfoWindow(
        title: 'Pothole',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: MarkerId('cracks1'),
      position: LatLng(21.451481, 39.213138),
      infoWindow: InfoWindow(
        title: 'Cracks',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Function to add marker based on user selection

  void _addMarker(LatLng position, Color color, String issueTitle) {
    BitmapDescriptor markerColor;
    if (color == Colors.red) {
      markerColor =
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else if (color == Colors.blue) {
      markerColor =
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    } else {
      markerColor =
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
    }

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("${position.latitude}_${position.longitude}"),
          position: position,
          icon: markerColor,
          infoWindow: InfoWindow(title: issueTitle), // يعرض اسم المشكلة هنا
        ),
      );
    });
  }

  void _showColorPicker(LatLng latLng) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            child: Column(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.circle, color: Colors.red),
                    title: Text('Lanes'),
                    onTap: () {
                      Navigator.pop(context);
                      _addMarker(
                          latLng, Colors.red, 'Lanes'); // تمرير اسم المشكلة
                    },
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.circle, color: Colors.blue),
                    title: Text('Pothole'),
                    onTap: () {
                      Navigator.pop(context);
                      _addMarker(
                          latLng, Colors.blue, 'Pothole'); // تمرير اسم المشكلة
                    },
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.circle, color: Colors.yellow),
                    title: Text('Cracks'),
                    onTap: () {
                      Navigator.pop(context);
                      _addMarker(
                          latLng, Colors.yellow, 'Cracks'); // تمرير اسم المشكلة
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: 500,
          height: 500,
          child: Column(
            children: [
              cl == null
                  ? CircularProgressIndicator()
                  : Container(
                      height: 450,
                      width: 500,
                      child: GoogleMap(
                        onTap: (LatLng latLng) {
                          _showColorPicker(latLng);
                        },
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 14.0,
                        ),
                        markers: _markers,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
