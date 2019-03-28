import 'dart:io';

import 'package:flutter/material.dart';
import 'helppatientinfo3.dart';
import 'confirmation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class PatientInfo3 extends StatefulWidget {
  @override
  _PatientInfo3State createState() => _PatientInfo3State();
}

class _PatientInfo3State extends State<PatientInfo3> {
  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  final woundController = TextEditingController();
  final mentalissuesController = TextEditingController();
  final prevmedrecordsController = TextEditingController();
  final additionalinfoController = TextEditingController();

  _persistPatientInfo3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('wound', woundController.text);
    prefs.setString('mental-issues', mentalissuesController.text);
    prefs.setString('past-med-records', prevmedrecordsController.text);
    prefs.setString('additional-info', additionalinfoController.text);
  }

  File _image;

  String wound;
  String mentalissues;
  String pastmedrecords;
  String additionalinfo;

  int numfiles = 0;

    Future _takePicture() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState((){
      _image = image;
    });
  }

  Future _selectPicture() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState((){
      _image = image;
    });
  }

  Future<Null> _uploadPicture() async{
    /*
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final StorageReference ref = FirebaseStorage.instance.ref().child('${user.email}/${user.email}_profilePicture.jpg');
    final StorageUploadTask uploadTask = ref.putFile(_image);
    final Uri downloadUrl = (await uploadTask.future).
    downloadUrl;
    */
  }

  void _selectAndUploadPicture() async{
    await _selectPicture();
    await _uploadPicture();
    numfiles++;
  }

  void _takeAndUploadPicture() async{
    await _takePicture();
    await _uploadPicture();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPatientInfo3()),
              );
            },
          ),
        ]),
        body: ListView(children: <Widget>[
          GestureDetector(
            onTap: () => _dismissKeyboard(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 24, bottom: 5, left: 28, right: 24),
                  child: Text('Wound', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 24, right: 24),
                  child: TextField(
                      controller: woundController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          labelText: '',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      maxLines: null),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 28),
                  child: Text('Mental Issues', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 20, left: 24, right: 24),
                  child: TextField(
                      controller: mentalissuesController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: '',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      maxLines: null),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 28, right: 24),
                  child: Text('Previous Medical Records',
                      style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 20, left: 24, right: 24),
                  child: TextField(
                      controller: prevmedrecordsController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          labelText: '',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      maxLines: null),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 28),
                  child: Text('Additional Information',
                      style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 20, left: 24, right: 24),
                  child: TextField(
                      controller: additionalinfoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: '',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      maxLines: null),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 28),
                      child: Text('Additional Files/Photos',
                          style: TextStyle(fontSize: 16)),
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_camera),
                      color: Colors.black,
                      onPressed: () {
                        _takeAndUploadPicture();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.attach_file),
                      color: Colors.black,
                      onPressed: () {
                         _selectAndUploadPicture();
                      },
                    ),
                    Text('$numfiles/5'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, bottom: 20),
                  child: SizedBox(
                    width: 80,
                    child: Text(
                        'You can upload up to 5 photos/files from your phone',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    child: Text('Next'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Confirmation()),
                      );
                      _persistPatientInfo3();
                    },
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
