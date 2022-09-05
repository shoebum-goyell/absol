
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:absol/main.dart';
import 'package:absol/range_calc.dart';
import 'dart:async';


class NewTask extends StatefulWidget {
  NewTask();
  @override
  _NewTaskState createState() => _NewTaskState();
}



double dett = MyHomePage().createState().latLng.latitude;
double bett = MyHomePage().createState().latLng.longitude;

class _NewTaskState extends State<NewTask> {
  @override
  void initState() {
    super.initState();
  }


  String contact, resource, condition, remarks, address;

  getContact(c) {
    this.contact = c;
  }

  getResource(r) {
    this.resource = r;
  }

  getCondition(co) {
    this.condition = co;
  }

  getRemarks(q) {
    this.remarks = q;
  }

  getAddress(h) {
    this.address = h;
  }


  int con = 0;
  String itemVal;

  void _handleTaskType(int v) {
    setState(() {
      con = v;
      switch (con) {
        case 1:
          itemVal = 'Critical';
          break;
        case 2:
          itemVal = 'Moderate';
          break;
        case 3:
          itemVal = 'Normal';
          break;
      }
    });
  }
  createData()  {



      print(dett);
      DocumentReference dr = Firestore.instance
          .collection('marker')
          .document("" + contact + remarks);
      Map<String, dynamic> itemslist = {
        "contact_info": contact,
        "longitude": bett,
        "latitude": dett,
        "condition": condition,
        "resource": resource,
        "remarks": remarks,
        "con": itemVal,
        "address": address,
      };
      dr.setData(itemslist).whenComplete(() {
        print("Saved");
      });




  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text("Add Your Details", style: TextStyle()),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xffffe699), const Color(0xffff9900)])),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 80,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        onChanged: (String c) {
                          getContact(c);
                        },
                        decoration: InputDecoration(
                            labelText: "Contact info and Address :",
                            prefixIcon: Icon(FontAwesomeIcons.addressCard,
                                color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        onChanged: (String co) {
                          getCondition(co);
                        },
                        decoration: InputDecoration(
                            labelText: "Condition : ",
                            prefixIcon: Icon(FontAwesomeIcons.book,
                                color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        onChanged: (String r) {
                          getResource(r);
                        },
                        decoration: InputDecoration(
                            labelText: "Current Possessions : ",
                            prefixIcon: Icon(FontAwesomeIcons.teeth,
                                color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                        onChanged: (String qty) {
                          getRemarks(qty);
                        },
                        decoration: InputDecoration(
                            labelText: "Remarks : ",
                            prefixIcon:
                            Icon(FontAwesomeIcons.th, color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "Select Condition :",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              onChanged: _handleTaskType,
                              groupValue: con,
                              activeColor: Colors.black,
                            ),
                            Text(
                              "Critical",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Radio(
                              value: 2,
                              onChanged: _handleTaskType,
                              groupValue: con,
                              activeColor: Colors.black,
                            ),
                            Text(
                              "Moderate",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Radio(
                              value: 3,
                              onChanged: _handleTaskType,
                              groupValue: con,
                              activeColor: Colors.black,
                            ),
                            Text(
                              "Normal",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                            color: Color(0xffffe699),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            )),
                        RaisedButton(
                            color: Color(0xffffe699),
                            onPressed: () {
                              createData();
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          )));
  }




}




