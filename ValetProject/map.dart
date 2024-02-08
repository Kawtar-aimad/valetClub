import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login_signup/ValetProject/Footer.dart';
import 'package:login_signup/ValetProject/SideBar.dart';
import 'package:login_signup/ValetProject/location_helper.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  // Completer<GoogleMapController> _mapController = Completer();
  // Position? position;
  // static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
  //     bearing: 0.0, target: LatLng(0.0, 0.0), tilt: 0.0, zoom: 17);

  // Future<void> getMyCurrentLocation() async {
  //   await LocationHelper.getCurrentLocation();
  //   position = await Geolocator.getLastKnownPosition().whenComplete(() {
  //     setState(() {});
  //   });
  // }

  // Widget buildMap() {
  //   return GoogleMap(
  //     mapType: MapType.normal,
  //     myLocationEnabled: true,
  //     zoomControlsEnabled: false,
  //     myLocationButtonEnabled: false,
  //     initialCameraPosition: _myCurrentLocationCameraPosition,
  //     onMapCreated: (GoogleMapController controller) {
  //       _mapController.complete(controller);
  //     },
  //   );
  // }

  //DOCUMENTATION

  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  // Future<void> _goToMyCurrentLocation() async {
  //   if (position != null) {
  //     final GoogleMapController controller = await _mapController.future;
  //     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //         target: LatLng(position!.latitude, position!.longitude),
  //         zoom: 17,
  //         tilt: 0.0,
  //         bearing: 0.0)));
  //   }
  // }
  List<QueryDocumentSnapshot> data = [];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Collection")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  String nom = "";
  String prenom = "";
  String res = "";
  String url = "";

  getNomPrenom() {
    for (int i = 0; i < data.length; i++) {
      nom = data[i]['nom'].toString();
      prenom = data[i]['prenom'].toString();
      res = prenom + " " + nom;
    }
    return res;
  }

  getUrl() {
    for (int i = 0; i < data.length; i++) {
      url = data[i]['url'].toString();
    }
    return url;
  }

  @override
  initState() {
    super.initState();
    getData();
    // getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: SideBar(
        getNomPrenom: getNomPrenom(),
        getUrl: getUrl(),
      )),
      // body: Stack(
      //   children: [buildMap()],
      // ),
      // body: Stack(
      //   children: [
      //     position != null
      //         ? buildMap()
      //         : Center(
      //             child: Container(
      //               child: CircularProgressIndicator(
      //                 color: Colors.blue,
      //               ),
      //             ),
      //           )
      //   ],
      // ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                margin: EdgeInsets.only(top: 40, left: 10),
                child: Builder(
                    builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.subject_rounded,
                          size: 30,
                          color: Colors.white,
                        ))),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 260),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.support_agent,
                      color: Colors.white,
                      size: 30,
                    )),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
