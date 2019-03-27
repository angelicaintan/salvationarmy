import 'package:flutter/material.dart';
import 'helppatientinfo2.dart';
import 'patientinfo3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientInfo2 extends StatefulWidget {
  @override
  _PatientInfo2State createState() => _PatientInfo2State();
}

class _PatientInfo2State extends State<PatientInfo2> {
  @override
  bool _smoking = false;
  bool _alcohol = false;
  bool _drugs = false;

  String heartrate;
  String bloodpressure;
  String bloodglucose;
  String bodyheight;
  String bodyweight;
  String bmi;
  String respirationrate;
  String additionalinfo;

  final heartrateController = TextEditingController();
  final bloodpressureController = TextEditingController();
  final bloodglucoseController = TextEditingController();
  final bodyheightController = TextEditingController();
  final bodyweightController = TextEditingController();
  final bmiController = TextEditingController();
  final respirationrateController = TextEditingController();
  final additionalinfoController = TextEditingController();

  var records = Firestore.instance.collection('Records').document();

  _persistPatientInfo2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('heart-rate', heartrate);
    prefs.setString('blood-pressure', bloodpressure);
    prefs.setString('blood-glucose', bloodglucose);
    prefs.setString('body-height', bodyheight);
    prefs.setString('body-weight', bodyweight);
    prefs.setString('BMI', bmi);
    prefs.setString('respiration-rate', respirationrate);
    prefs.setBool('smoking', _smoking);
    prefs.setBool('alcohol', _alcohol);
    prefs.setBool('drugs', _drugs);
    prefs.setString('additional-info1', additionalinfo);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Info'),
      ),
      body: ListView(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              decoration: BoxDecoration (
                //image: new DecorationImage(image: AssetImage('assets/icons/Slide1.PNG')),
              )
            ),
            Text(
              'Heart Rate',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: TextField(
                controller: heartrateController,
                onChanged: (text) {
                  heartrate = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'E.g. 50 bpm',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ]),
          Row(children: <Widget>[
            Text(
              'Blood Pressure',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: TextField(
                controller: bloodpressureController,
                onChanged: (text) {
                  bloodpressure = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'E.g. 120/80 ',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ]),
          Row(children: <Widget>[
            Text(
              'Blood Glucose',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: TextField(
                controller: bloodglucoseController,
                onChanged: (text) {
                  bloodglucose = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'E.g. 4.5 mmol/L',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            )
          ]),
          Row(children: <Widget>[
            Text(
              'Body Height',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: TextField(
                controller: bodyheightController,
                onChanged: (text) {
                  bodyheight = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'E.g. 170 cm',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ]),
          Row(children: <Widget>[
            Text(
              'Body Weight',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: TextField(
                controller: bodyweightController,
                onChanged: (text) {
                  bodyweight = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'E.g. 70 kg',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ]),
          Row(children: <Widget>[
            Text(
              'BMI',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: TextField(
                controller: bmiController,
                onChanged: (text) {
                  bmi = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'E.g. ',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ]),
          Row(children: <Widget>[
            Text(
              'Respiration Rate',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: TextField(
                controller: respirationrateController,
                onChanged: (text) {
                  respirationrate = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'E.g. ',
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
          ]),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text('Smoking'),
              ),
              new Checkbox(
                value: _smoking,
                onChanged: (bool newValue) {
                  setState(() {
                    _smoking = newValue;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Alcohol'),
              ),
              new Checkbox(
                value: _alcohol,
                onChanged: (bool newValue) {
                  setState(() {
                    _alcohol = newValue;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Drugs'),
              ),
              new Checkbox(
                value: _drugs,
                onChanged: (bool newValue) {
                  setState(() {
                    _drugs = newValue;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text('Additional Information'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.2,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'E.g. Lost a lot of weight recently',
                  labelStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          RaisedButton(
            child: Text('Next'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientInfo3()),
              );
              _persistPatientInfo2();
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: RaisedButton(
              child: Text('?'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPatientInfo2()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
