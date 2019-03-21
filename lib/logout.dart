import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Out'),
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
                'Back'
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}