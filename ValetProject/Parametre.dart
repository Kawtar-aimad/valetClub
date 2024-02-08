import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/ValetProject/Footer.dart';

class Parametre extends StatefulWidget {
  const Parametre({super.key});

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
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

  getData1() {
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
            "Paramètre",
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
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        getData1(),
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
                SizedBox(
                  width: 100,
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
                    color: Colors.amber,
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
                  width: 180,
                  child: Text(
                    "Reviews",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
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
                    Icons.language,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 180,
                  child: Text(
                    "Language",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 90,
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
                    color: Colors.lightBlue,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 180,
                  child: Text(
                    "Notificatpions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
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
                    color: Colors.amberAccent,
                  ),
                  child: Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 180,
                  child: Text(
                    "FAQ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
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
                    color: Colors.grey,
                  ),
                  child: Icon(
                    Icons.add_moderator,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 180,
                  child: Text(
                    "Conditions générales",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
