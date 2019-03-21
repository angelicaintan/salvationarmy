import 'dart:async';
import 'package:flutter/material.dart';

class HelpNewRecord extends StatefulWidget {
  @override
  _HelpNewRecordState createState() => _HelpNewRecordState();
}

class _HelpNewRecordState extends State<HelpNewRecord> {

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