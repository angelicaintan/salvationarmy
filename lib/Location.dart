import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'helplocation.dart';
import 'patientinfo1.dart';
import 'main.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kdefaultLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> _getCurrentPosition() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 18,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width*0.75,
              height: MediaQuery.of(context).size.height*0.5,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kdefaultLocation,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            RaisedButton(
              child: Text(
                'Log Out'
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
            RaisedButton(
              child: Text('Locate me'),
              onPressed: () {
                _getCurrentPosition();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8
              ),
            ),
            RaisedButton(
              child: Text(
                'Next'
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientInfo1()),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8
              ),
            ),
            RaisedButton(
              child: Text(
                '?'
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpLocation()),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}