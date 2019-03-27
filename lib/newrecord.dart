import 'dart:async';
import 'package:flutter/material.dart';
import 'helppatientinfo1.dart';
import 'helpnewrecord.dart';
import 'Location.dart';
import 'main.dart';

class NewRecord extends StatefulWidget {
  @override
  _NewRecordState createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              Align(
                  alignment: Alignment.topRight,
                    child: RaisedButton(
                      padding: EdgeInsets.all(5.0),
                      child: Text ('Log Out'),
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                    )
                  ),
              RaisedButton(
                child: Text('New Record'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Location()),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              RaisedButton(
                child: Text('Finish Outreach'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              RaisedButton(
                child: Text('?'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpNewRecord()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
