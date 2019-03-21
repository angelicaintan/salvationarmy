import 'package:flutter/material.dart';
import 'helppatientinfo3.dart';
import 'confirmation.dart';

class PatientInfo3 extends StatefulWidget {
  @override
  _PatientInfo3State createState() => _PatientInfo3State();
}

final myController = TextEditingController();

class _PatientInfo3State extends State<PatientInfo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Patient Info'),
        ),
        body: SingleChildScrollView(
          // width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Wound'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: '',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Mental Issues'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: '',
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text('Additional Information for Above Categories'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: '',
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
                    MaterialPageRoute(builder: (context) => Confirmation()),
                  );
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
