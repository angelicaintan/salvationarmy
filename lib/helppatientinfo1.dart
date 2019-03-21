import 'dart:async';
import 'package:flutter/material.dart';

class HelpPatientInfo1 extends StatefulWidget {
  @override
  _HelpPatientInfo1State createState() => _HelpPatientInfo1State();
}

class _HelpPatientInfo1State extends State<HelpPatientInfo1> {

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