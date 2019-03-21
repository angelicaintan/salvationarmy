import 'dart:async';
import 'package:flutter/material.dart';

class HelpPatientInfo3 extends StatefulWidget {
  @override
  _HelpPatientInfo3State createState() => _HelpPatientInfo3State();
}

class _HelpPatientInfo3State extends State<HelpPatientInfo3> {

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