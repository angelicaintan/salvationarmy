import 'package:flutter/material.dart';
import 'helppatientinfo3.dart';
import 'confirmation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientInfo3 extends StatefulWidget {
  @override
  _PatientInfo3State createState() => _PatientInfo3State();
}

class _PatientInfo3State extends State<PatientInfo3> {
  final woundController = TextEditingController();
  final mentalissuesController = TextEditingController();
  final prevmedrecordsController = TextEditingController();
  final additionalinfoController = TextEditingController();

  var records = Firestore.instance.collection('Records').document();

  _persistPatientInfo3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('wound', woundController.text);
    prefs.setString('mental-issues', mentalissuesController.text);
    prefs.setString('past-med-records', prevmedrecordsController.text);
    prefs.setString('additional-info', additionalinfoController.text);
  }

  Future<Null> _saveRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> recordMap = {
      'a. access-code': prefs.getString('access-code') ?? 0,
      'b. user-name': prefs.getString('user-name') ?? 0,
      'c. user-contact': prefs.getString('user-contact') ?? 0,

      'd. name': prefs.getString('name') ?? 0,
      'e. gender': prefs.getString('gender') ?? 0,
      'f. contact': prefs.getString('contact') ?? 0,
      'g. HKID': prefs.getString('hkid') ?? 0,
      'h. CSSA': prefs.getBool('cssa') ?? 0,
      'i. birthday': prefs.getString('birthday') ?? 0,
      'j. age': prefs.getString('age') ?? 0,

      'k. heart-rate': prefs.getString('heart-rate') ?? 0,
      'l. blood-pressure': prefs.getString('blood-pressure') ?? 0,
      'm. blood-glucose': prefs.getString('blood-glucose') ?? 0,
      'n. body-height': prefs.getString('body-height') ?? 0,
      'o. body-weight': prefs.getString('body-weight') ?? 0,
      'p. bmi': prefs.getString('BMI') ?? 0,
      'q. respiration-rate': prefs.getString('respiration-rate') ?? 0,
      'r. smoking': prefs.getBool('smoking') ?? 0,
      's. alcohol': prefs.getBool('alcohol') ?? 0,
      't. drugs': prefs.getBool('drugs') ?? 0,
      'u. additional-info1': prefs.getString('additional-info1') ?? 0,

      'v. wound': prefs.getString('wound') ?? 0,
      'w. mental-issues': prefs.getString('mental-issues') ?? 0,
      'x. past-med-records': prefs.getString('past-med-records') ?? 0,
      'y. additional-info': prefs.getString('additional-info') ?? 0,
    };
    records.setData(recordMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Patient Info'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Wound'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                    controller: woundController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: '',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    maxLines: null),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Mental Issues'),
              ),
               Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                    controller: mentalissuesController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: '',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    maxLines: null),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Previous Medical Records'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                    controller: prevmedrecordsController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: '',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    maxLines: null),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Additional Information for Above Categories'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                    controller: additionalinfoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: '',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    maxLines: null),
              ),
              RaisedButton(
                child: Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Confirmation()),
                  );
                  _persistPatientInfo3();
                  _saveRecord();
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.1),
                child: RaisedButton(
                  child: Text('?'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpPatientInfo3()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
