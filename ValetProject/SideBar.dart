import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final String getNomPrenom;
  final String getUrl;

  SideBar({
    super.key,
    required this.getNomPrenom,
    required this.getUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Color(0xff262629),
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(top: 50, left: 15, bottom: 50),
              child: InkWell(
                child: Row(
                  children: [
                    Column(
                      children: [
                        if (getUrl != "none")
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.network(
                                getUrl,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 165,
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            getNomPrenom,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            "Gold Member",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.person),
                ),
                Container(
                    child: MaterialButton(
                        child: Text(
                          "Profil",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "profil");
                        })),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.diversity_2),
              ),
              Container(
                  child: MaterialButton(
                      child: Text(
                        "Partenaires",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "All");
                      })),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.map),
              ),
              Container(
                  child: MaterialButton(
                      child: Text(
                        "Maps",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "map");
                      })),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.settings),
              ),
              Container(
                  child: MaterialButton(
                      child: Text(
                        "Paramètre",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "parametre");
                      })),
            ],
          ),
          //BUTTON DECONNEXION
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: 80),
            child: MaterialButton(
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.logout,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Déconnexion",
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  ),
                ],
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("login", (route) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}
