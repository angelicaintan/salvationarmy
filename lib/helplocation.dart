import 'dart:async';
import 'package:flutter/material.dart';

class HelpLocation extends StatefulWidget {
  @override
  _HelpLocationState createState() => _HelpLocationState();
}

class _HelpLocationState extends State<HelpLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width*0.75,
              height: MediaQuery.of(context).size.height*0.5,
            ),
          ],
        ),
      )
    );
  }
}