import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_signup/ValetProject/CardsPar.dart';
import 'package:login_signup/ValetProject/Footer.dart';
import 'package:login_signup/ValetProject/SideBar.dart';
import 'package:login_signup/ValetProject/sliders.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Partenaire extends StatefulWidget {
  const Partenaire({super.key});

  @override
  State<Partenaire> createState() => _PartenaireState();
}

class _PartenaireState extends State<Partenaire> {
  int currentIndex = 0;
  int currentIndex1 = 0;
  final items = [
    Sliders(
      pic: "images/home.jpg",
    ),
    Sliders(pic: "images/homeProfil.png"),
  ];
  final items1 = [CardsPar(), CardsPar()];
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
      drawer: Drawer(
          child: SideBar(
        getNomPrenom: getNomPrenom(),
        getUrl: getUrl(),
      )),
      body: Container(
        child: ListView(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
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

                //Container 3 pour les buttons horizontals

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

                //Container 4 pour sliders
                Container(
                  margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: CarouselSlider(
                      items: items,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(microseconds: 800),
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 2),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: items.length,
                    effect: WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 10,
                        activeDotColor: Colors.black,
                        paintStyle: PaintingStyle.fill),
                  ),
                ),

                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Partenaires",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                              "Solution VALET CLUB aux Sites patrimoniaux à Casablanca"),
                        )
                      ]),
                ),

                //CARDS horizontal:
                Container(
                  // decoration: BoxDecoration(boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black,
                  //     blurRadius: 20,
                  //     offset: Offset(0, 0),
                  //     spreadRadius: 0,
                  //   )
                  // ]),
                  margin: EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Container(
                    child: CarouselSlider(
                        items: items1,
                        options: CarouselOptions(
                          height: 450,
                          autoPlay: false,
                          autoPlayAnimationDuration:
                              Duration(microseconds: 800),
                          enlargeCenterPage: true,
                          autoPlayInterval: Duration(seconds: 2),
                          viewportFraction: 1,
                        )),
                  ),
                  // Container(
                  //   height: 450,
                  //   width: 350,
                  //   child: Card(
                  //     // color: Colors.white,
                  //     child: Column(
                  //       children: [
                  //         Stack(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.all(5),
                  //               width: 280,
                  //               child: Image.asset(
                  //                 "images/rec.png",
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //             Container(
                  //               alignment: Alignment.centerRight,
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                     BorderRadius.circular(10),
                  //                 color: Colors.black.withOpacity(0.4),
                  //               ),
                  //               margin:
                  //                   EdgeInsets.only(top: 105, left: 5),
                  //               padding: EdgeInsets.only(right: 5),
                  //               width: 280,
                  //               height: 45,
                  //               child: Text(
                  //                 "Concert & Festival",
                  //                 style: TextStyle(color: Colors.white),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //         Container(
                  //           padding: EdgeInsets.only(left: 20),
                  //           child: Row(
                  //             children: [
                  //               Column(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Container(
                  //                     child: Text(
                  //                       "Megarama",
                  //                       style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 20),
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     width: 250,
                  //                     child: Text(
                  //                       "Nous mettons en place un point de rencontre pour les voituriers à proximité, permettant aux spectateur d'accéder facilement à l'exposition sur le patrimoine spectacle.",
                  //                       style: TextStyle(fontSize: 10),
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //               Container(
                  //                 child: Image.asset(
                  //                     "images/Rectangle1.png"),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.only(left: 10, top: 5),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 child: Icon(
                  //                   Icons.add_location,
                  //                   size: 30,
                  //                 ),
                  //               ),
                  //               Container(
                  //                 padding: EdgeInsets.only(left: 5),
                  //                 child: Text(
                  //                   "Ain diab casablanca",
                  //                   style: TextStyle(fontSize: 20),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.only(left: 10, top: 5),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 margin: EdgeInsets.only(left: 5),
                  //                 child: Icon(Icons.access_time),
                  //               ),
                  //               Container(
                  //                 padding: EdgeInsets.only(left: 10),
                  //                 child: Text(
                  //                   "12 : 00 - 23 : 00",
                  //                   style: TextStyle(fontSize: 20),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         Container(
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 margin: EdgeInsets.only(left: 15),
                  //                 child: Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Container(
                  //                         child: Text("Prix Ticket"),
                  //                       ),
                  //                       Container(
                  //                         child: Text(
                  //                           "400 DHS",
                  //                           style: TextStyle(
                  //                               color: Colors.purple),
                  //                         ),
                  //                       )
                  //                     ]),
                  //               ),
                  //               Container(
                  //                 margin: EdgeInsets.only(left: 150),
                  //                 child: Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.end,
                  //                     children: [
                  //                       Container(
                  //                         child: Text("Prix volet"),
                  //                       ),
                  //                       Container(
                  //                         child: Text(
                  //                           "400 DHS",
                  //                           style: TextStyle(
                  //                               color: Colors.purple),
                  //                         ),
                  //                       )
                  //                     ]),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.only(left: 15, top: 20),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 child: MaterialButton(
                  //                   shape: RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(10)),
                  //                   color: Colors.green,
                  //                   child: Text(
                  //                     "Valet disponaible",
                  //                     style: TextStyle(
                  //                         color: Colors.white),
                  //                   ),
                  //                   onPressed: () {},
                  //                 ),
                  //               ),
                  //               Container(
                  //                 margin: EdgeInsets.only(left: 40),
                  //                 child: Icon(
                  //                   Icons.call,
                  //                   size: 30,
                  //                 ),
                  //               ),
                  //               Container(
                  //                 margin: EdgeInsets.only(left: 5),
                  //                 child: Text(
                  //                   "0646436078",
                  //                   style: TextStyle(fontSize: 15),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),

                //CARDS VERTICAL
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          " Sites patrimoniaux à Casablanca",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(right: 5, bottom: 10),
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      // alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: 148,
                                      height: 160,
                                      // alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          "images/Rectangle2.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  Container(
                                    width: 150,
                                    height: 30,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 5),
                                    margin: EdgeInsets.only(top: 135, left: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black.withOpacity(0.5)),
                                    child: Text(
                                      "Concert",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 5, left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "studio des arts vivants",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.add_location,
                                                        size: 18,
                                                      ),
                                                    ),
                                                    Container(
                                                      // width: 160,
                                                      padding: EdgeInsets.only(
                                                          left: 3),
                                                      child: Text(
                                                        "38 Bd Abdelhadi Boutaleb, Casablanca",
                                                        style: TextStyle(
                                                            fontSize: 7),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Icon(
                                                        Icons.access_time,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "12 : 00 - 23 : 00",
                                                        style: TextStyle(),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.topCenter,
                                            child: Image.asset(
                                                "images/Rectangle1.png"),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text("Prix Ticket"),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "900 DHS",
                                                    style: TextStyle(
                                                        color: Colors.purple),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 130,
                                            alignment: Alignment.centerRight,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text("Prix valet"),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "350 DHS",
                                                    style: TextStyle(
                                                        color: Colors.purple),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              "Valet disponaible",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Icon(
                                                    Icons.call,
                                                    size: 20,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text("0646436078"),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
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
