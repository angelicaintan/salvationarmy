import 'dart:async';
import 'package:flutter/material.dart';
import 'helpconfirmation.dart';
import 'package:share/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logout.dart';
import 'newrecord.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  var records = Firestore.instance.collection('Records').document();

  Future<Null> _saveRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> recordMap = {
      'a. access-code': prefs.getString('access-code') ?? 0,
      'b. user-name': prefs.getString('user-name') ?? 0,
      'c. user-contact': prefs.getString('user-contact') ?? 0,
      'd. location': prefs.getString('location') ?? 0,
      'e. name': prefs.getString('name') ?? 0,
      'f. gender': prefs.getString('gender') ?? 0,
      'g. contact': prefs.getString('contact') ?? 0,
      'h. HKID': prefs.getString('hkid') ?? 0,
      'i. CSSA': prefs.getBool('cssa') ?? 0,
      'j. birthday': prefs.getString('birthday') ?? 0,
      'k. age': prefs.getString('age') ?? 0,
      'l. reject:': prefs.getBool('reject') ?? 0,
      'm. heart-rate': prefs.getString('heart-rate') ?? 0,
      'n. blood-pressure': prefs.getString('blood-pressure') ?? 0,
      'o. blood-glucose': prefs.getString('blood-glucose') ?? 0,
      'p. body-height': prefs.getString('body-height') ?? 0,
      'q. body-weight': prefs.getString('body-weight') ?? 0,
      'r. bmi': prefs.getString('BMI') ?? 0,
      's. respiration-rate': prefs.getString('respiration-rate') ?? 0,
      't. smoking': prefs.getBool('smoking') ?? 0,
      'u. alcohol': prefs.getBool('alcohol') ?? 0,
      'v. drugs': prefs.getBool('drugs') ?? 0,
      'w. additional-info1': prefs.getString('additional-info1') ?? 0,
      'x. wound': prefs.getString('wound') ?? 0,
      'y. mental-issues': prefs.getString('mental-issues') ?? 0,
      'z. past-med-records': prefs.getString('past-med-records') ?? 0,
      'zz. additional-info': prefs.getString('additional-info') ?? 0,
    };
    records.setData(recordMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Files'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpConfirmation()),
              );
            },
          ),
        ]),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('1. 2019/02/28_22:23_Mark'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('2. 2019/02/28_22:50_Suvi'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('3. 2019/02/28_23:00_Panda'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('4. 2019/02/28_23:02_Lemon'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('5. 2019/02/28_23:07_Reese'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 24, bottom: 24, left: 10, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ]),
                RaisedButton(
                  child: Text('Add Record'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewRecord()),
                    );
                  },
                ),
                Padding (
                  padding: EdgeInsets.all(10),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    child: Text('Send & Logout'),
                    onPressed: () {
                      _saveRecord();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogOut()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            ),
          ],
        ));
  }
}
