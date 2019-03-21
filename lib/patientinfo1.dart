import 'package:flutter/material.dart';
import 'helppatientinfo1.dart';
import 'patientinfo2.dart';
import 'newrecord.dart';

class PatientInfo1 extends StatefulWidget {
  @override
  _PatientInfo1State createState() => _PatientInfo1State();
}

class _PatientInfo1State extends State<PatientInfo1> {
  String gender;
  String name;
  String contact;
  String cssa;
  String hkid;
  String sex;
  String agestring;

  double age;

  int _radioValue = 0;

  void _genderChange(int value) {
    setState(() {
      _radioValue = value;
      sex = 'female';
    });
  }

  void _cssaChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  DateTime selectedDate = DateTime.now();
  DateTime dateNow = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        calculateAge();
      });
  }

  _printLatestValue() {
    print(age);
  }

  void calculateAge() {
    setState(() {
      age = (dateNow.year - selectedDate.year).toDouble();
    });
  }

  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final hkidController = TextEditingController();
  final ageController = TextEditingController();

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
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                      groupValue: 1,
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
                      groupValue: 1,
                      value: 0,
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
                      groupValue: 1,
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
                      groupValue: 1,
                      value: 0,
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
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: TextField(
                  controller: ageController,
                  onChanged: (text) {
                    agestring = text;
                  },
                  keyboardType: TextInputType.text,
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
        ));
  }
}
