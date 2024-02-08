import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/ValetProject/Footer.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          )),
      body: Container(
        color: Color(0xffF5F5F5),
        padding: EdgeInsets.only(top: 30),
        child: ListView(children: [
          Container(
            color: Colors.white,
            width: 500,
            height: 140,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (getUrl() != "none")
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.network(
                            getUrl(),
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ))
                    else
                      Container(
                        height: 90,
                        width: 90,
                        child: Image.asset("images/profile.png"),
                      ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          getNomPrenom(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            "Gold Member",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "Gestion de véhicules",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.description_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "Gestion de documents",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "Endroits préférés",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
