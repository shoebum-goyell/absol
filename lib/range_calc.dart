import 'package:absol/main.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class Range extends StatefulWidget {
  Range();
  @override
  _RangeState createState() => _RangeState();

}

class _RangeState extends State<Range> {
  @override
  void initState() {
    super.initState();
  }
  int sh = 0;
  static double lat = 0;
  static double long = 0;
  LatLng latLng = LatLng(0, 0);

  double latitude, longitude, range;

  getLatitude(la) {
    this.latitude = la;
  }
  getLongitude(lo) {
    this.latitude = lo;
  }
  getRange(r) {
    this.range = r;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Container(
        alignment: Alignment.centerLeft,
        child: Text("Disaster Range", style: TextStyle()),
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
                          onChanged: (String la) {
                            getLatitude(la);
                          },
                          decoration: InputDecoration(
                              labelText: "Latitude : ",
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
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          onChanged: (String lo) {
                            getLongitude(lo);
                          },
                          decoration: InputDecoration(
                              labelText: "Longitude : ",
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
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          onChanged: (String r) {
                            getRange(r);
                          },
                          decoration: InputDecoration(
                              labelText: "Range : ",
                              prefixIcon: Icon(FontAwesomeIcons.teeth,
                                  color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),

                      SizedBox(
                        height: 10.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                              color: Color(0xffffe699),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage(), fullscreenDialog: true),
                                );
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              )),
                          RaisedButton(
                              color: Color(0xffffe699),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage(), fullscreenDialog: true),
                                );
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



