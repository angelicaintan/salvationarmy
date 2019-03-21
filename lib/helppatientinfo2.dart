import 'dart:async';
import 'package:flutter/material.dart';

class HelpPatientInfo2 extends StatefulWidget {
  @override
  _HelpPatientInfo2State createState() => _HelpPatientInfo2State();
}

class _HelpPatientInfo2State extends State<HelpPatientInfo2> {

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