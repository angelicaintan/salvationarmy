import 'package:flutter/material.dart';
import 'helppatientinfo1.dart';
import 'patientinfo2.dart';
import 'newrecord.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientInfo1 extends StatefulWidget {
  @override
  _PatientInfo1State createState() => _PatientInfo1State();
}

class _PatientInfo1State extends State<PatientInfo1> {
  String name;
  String contact;
  bool cssa;
  String hkid;
  String gender;
  String birthday = ' ';
  String agestring;
  int age;

  double agefull;

  int _genderValue = -1;
  int _cssaValue = -1;

  void _genderChange(int value) {
    setState(() {
      _genderValue = value;

      switch (_genderValue) {
        case 0:
          gender = 'female';
          break;
        case 1:
          gender = 'male';
          break;
      }
    });
  }

  void _cssaChange(int value) {
    setState(() {
      _cssaValue = value;

      switch (_cssaValue) {
        case 0:
          cssa = true;
          break;
        case 1:
          cssa = false;
          break;
      }
    });
  }

  DateTime selectedDate = DateTime.now();
  DateTime dateNow = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birthday = selectedDate.toString();
        agefull = ((dateNow.year + (dateNow.month / 12)) -
                (selectedDate.year + (selectedDate.month / 12)))
            .toDouble();
        age = agefull.toInt();
        ageController.text = '$age';
      });
  }

  var records = Firestore.instance.collection('Records').document();

  _persistPatientInfo1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('gender', gender);
    prefs.setString('contact', contact);
    prefs.setBool('cssa', cssa);
    prefs.setString('HKID', hkid);
    prefs.setString('birthday', birthday);
    prefs.setString('age', agestring);
  }

  _printLatestValue() {
    print(age);
  }

  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final hkidController = TextEditingController();
  final ageController = TextEditingController();
  final birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ageController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Information'),
        ),
        body: ListView(
          children: <Widget> [
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: TextField(
                  controller: nameController,
                  onChanged: (text) {
                    name = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text('Gender : F'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Radio(
                      groupValue: _genderValue,
                      value: 0,
                      onChanged: _genderChange,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text('M'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Radio(
                      groupValue: _genderValue,
                      value: 1,
                      onChanged: _genderChange,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: TextField(
                  controller: contactController,
                  onChanged: (text) {
                    contact = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Contact',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: TextField(
                  controller: hkidController,
                  onChanged: (text) {
                    hkid = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'HKID',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text('CSSA : Y'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Radio(
                      groupValue: _cssaValue,
                      value: 0,
                      onChanged: _cssaChange,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text('N'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Radio(
                      groupValue: _cssaValue,
                      value: 1,
                      onChanged: _cssaChange,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Date of Birth'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical:8),
                child: Text (birthday),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: TextField(
                  controller: ageController,
                  onChanged: (text) {
                    setState(() {
                      agestring = text;
                      
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Age',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              RaisedButton(
                child: Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientInfo2()),
                  );
                  _persistPatientInfo1();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              RaisedButton(
                child: Text('Reject'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewRecord()),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              ),
              RaisedButton(
                child: Text('?'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPatientInfo1()),
                  );
                },
              ),
            ],
          ),
          ]
        ));
  }
}
