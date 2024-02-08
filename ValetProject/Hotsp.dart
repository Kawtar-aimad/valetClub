import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/ValetProject/Footer.dart';
import 'package:login_signup/ValetProject/Image.dart';
import 'package:login_signup/ValetProject/SideBar.dart';

class Hotspo extends StatefulWidget {
  const Hotspo({super.key});

  @override
  State<Hotspo> createState() => _HotspoState();
}

class _HotspoState extends State<Hotspo> {
  Color buttonColorA = Color(0xffF2F2F2);
  Color textColorA = Colors.black;
  Color textColorP = Colors.black;
  Color textColorP1 = Colors.black;
  Color textColorH = Colors.black;
  Color buttonColorP = Color(0xffF2F2F2);
  Color buttonColorP1 = Color(0xffF2F2F2);
  Color buttonColorH = Color(0xffF2F2F2);

  void _changeButtonState(String hh) {
    if (hh == "1") {
      buttonColorA = Colors.black;
      buttonColorP = Color(0xffF2F2F2);
      buttonColorH = Color(0xffF2F2F2);
      buttonColorP1 = Color(0xffF2F2F2);
      textColorA = Color(0xffF2F2F2);
      textColorP = Colors.black;
      textColorH = Colors.black;
      textColorP1 = Colors.black;
    } else if (hh == "2") {
      buttonColorA = Color(0xffF2F2F2);
      buttonColorP = Colors.black;
      buttonColorH = Color(0xffF2F2F2);
      buttonColorP1 = Color(0xffF2F2F2);
      textColorA = Colors.black;
      textColorP = Color(0xffF2F2F2);
      textColorH = Colors.black;
      textColorP1 = Colors.black;
    } else if (hh == "3") {
      buttonColorA = Color(0xffF2F2F2);
      buttonColorP = Color(0xffF2F2F2);
      buttonColorH = Colors.black;
      buttonColorP1 = Color(0xffF2F2F2);
      textColorA = Colors.black;
      textColorP = Colors.black;
      textColorH = Color(0xffF2F2F2);
      textColorP1 = Colors.black;
    } else if (hh == "4") {
      buttonColorA = Color(0xffF2F2F2);
      buttonColorP = Color(0xffF2F2F2);
      buttonColorH = Color(0xffF2F2F2);
      buttonColorP1 = Colors.black;
      textColorA = Colors.black;
      textColorP = Colors.black;
      textColorH = Colors.black;
      textColorP1 = Color(0xffF2F2F2);
    }
  }

  void _resetButtonState(hh) {
    setState(() {
      _changeButtonState(hh);
    });
  }

  bool isIconSwitched = false;
  bool isIconSwitched1 = false;
  bool isIconSwitched2 = false;
  bool isIconSwitched3 = false;
  bool isIconSwitched4 = false;
  // final SearchBarButtons anotherClassInstance = SearchBarButtons();

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
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
            _resetButtonState("");
          },
        ),
      ),
     drawer: Drawer(child: SideBar(getNomPrenom: getNomPrenom(),getUrl: getUrl(),)),
      body: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Builder(
                      builder: (context) => IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ))),
                ),

                // Container(
                //   child: SearchBarButtons(),
                // )

                //Container 1 pour icon et texte

                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(children: [
                    Icon(
                      Icons.circle_notifications_rounded,
                      size: 40,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CASABLANCA BOURGONE 03902 RUE CH"),
                            Text(
                              "Current Location",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            )
                          ]),
                    )
                  ]),
                ),

                //Container 2 pour SeerchBar

                Container(
                    padding: EdgeInsets.only(left: 15),
                    margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
                    child: Stack(
                      children: [
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                size: 40,
                              ),
                              hintText: "Search Places",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: Colors.black)),
                              // icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    )),

                //Container 3 our les buttons horizontals

                Container(
                    padding: EdgeInsets.only(left: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: buttonColorA,
                                ),
                                onPressed: () {
                                  _resetButtonState("1");
                                  Navigator.pushNamed(context, "All");
                                },
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "All",
                                    style: TextStyle(color: textColorA),
                                  ),
                                ),
                              )),
                          Container(
                              width: 200,
                              padding: EdgeInsets.only(left: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: buttonColorP,
                                ),
                                onPressed: () {
                                  _resetButtonState("2");
                                  Navigator.pushNamed(context, "popular");
                                },
                                child: Text(
                                  "Popular",
                                  style: TextStyle(color: textColorP),
                                ),
                              )),
                          Container(
                            width: 200,
                            padding: EdgeInsets.only(left: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: buttonColorH,
                                ),
                                child: Text(
                                  "Hotspo",
                                  style: TextStyle(color: textColorH),
                                ),
                                onPressed: () {
                                  _resetButtonState("3");
                                  Navigator.pushNamed(context, "hotspo");
                                }),
                          ),
                          Container(
                            width: 200,
                            padding: EdgeInsets.only(left: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      buttonColorP1, // Set the background color dynamically
                                ),
                                child: Text(
                                  "Partenaires",
                                  style: TextStyle(color: textColorP1),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "partenaires");

                                  _resetButtonState("4");
                                }),
                          ),
                        ],
                      ),
                    )),

                //HOME PROFILE
                Container(
                  width: 500,
                  margin: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset(
                          'images/homeProfil.png',
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 140),
                        child: Image.asset('images/homeProfil1.png'),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Chfinja masters",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50, right: 50, top: 20),
                        alignment: Alignment.center,
                        child: Text(
                            "Chfinja MASTERS, est un café restaurant. Cadre Chic et chaleureux ce café s’est recentré sur le bien être de ces clients. "),
                      ),
                      Container(
                        child: Icon(
                          Icons.add_location_rounded,
                          size: 30,
                        ),
                      ),
                      Container(
                        child: Text("9 Rue lamia bourgone Casablanca"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(Icons.share),
                            ),
                            InkWell(
                                child: isIconSwitched3
                                    ? Icon(
                                        Icons.favorite_rounded,
                                        size: 25,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_border_outlined,
                                        size: 25,
                                      ),
                                onTap: () {
                                  setState(() {
                                    isIconSwitched3 = !isIconSwitched3;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "A propos",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                            "Chfinja MASTERS, est un café restaurant. Cadre Chic et chaleureux ce café s’est recentré sur le bien être de ces clients..."),
                      ),
                      Container(
                        child: Text(
                          "Lire la suite",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        color: Colors.red,
                        height: 2,
                        width: 80,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 160,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Text(
                                  "Voir Menu",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.black,
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              width: 160,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Text(
                                  "Voir Menu",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.black,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 460,
                        margin: EdgeInsets.only(right: 20),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Voir Menu",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
