import 'dart:async';
import 'package:flutter/material.dart';
import 'helpconfirmation.dart';
import 'package:share/share.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width*0.75,
              height: MediaQuery.of(context).size.height*0.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8
              ),
            ),
            RaisedButton(
              child: Text(
                'Send'
              ),
              onPressed: () {
                Share.share('text');
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
                  MaterialPageRoute(builder: (context) => HelpConfirmation()),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}