import 'dart:async';
import 'package:flutter/material.dart';

class HelpMain extends StatefulWidget {
  @override
  _HelpMainState createState() => _HelpMainState();
}

class _HelpMainState extends State<HelpMain> {

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