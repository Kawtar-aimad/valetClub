import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/ValetProject/Footer.dart';
import 'package:login_signup/ValetProject/SideBar.dart';
import 'package:login_signup/ValetProject/sliders.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  int currentIndex = 0;
  final items = [
    Sliders(
      pic: "images/home.jpg",
    ),
    Sliders(pic: "images/homeProfil.png"),
  ];
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
        margin: EdgeInsets.only(left: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //icon for sidebar

                Container(
                  alignment: Alignment.topLeft,
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
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  buttonColorA, // Set the background color dynamically
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
                              primary:
                                  buttonColorP, // Set the background color dynamically
                            ),
                            onPressed: () {
                              _resetButtonState("2");
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
                              primary:
                                  buttonColorH, // Set the background color dynamically
                            ),
                            child: Text(
                              "Hotspo",
                              style: TextStyle(color: textColorH),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "hotspo");

                              _resetButtonState("3");
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
                  margin: EdgeInsets.only(top: 20, right: 10),
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
                // Container(
                //   margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
                //   child: Stack(
                //     children: [
                //       Container(
                //         width: 500.0,
                //         height: 200.0,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                //           image: DecorationImage(
                //               image: AssetImage('images/home.jpg'),
                //               fit: BoxFit.cover),
                //         ),
                //       ),
                //       Container(
                //         width: 500.0,
                //         height: 200.0,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                //         ),
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(10)),
                //             gradient: LinearGradient(
                //               begin: Alignment.topLeft,
                //               end: Alignment.bottomRight,
                //               colors: [
                //                 Colors.blue.withOpacity(0.9),
                //                 Colors.blue.withOpacity(0.0),
                //               ],
                //             )),
                //         child: Container(
                //           width: 500,
                //           height: 200,
                //           padding: EdgeInsets.only(left: 20, top: 30),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 child: Text(
                //                   "Offres de restauration ",
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               Container(
                //                 width: 200,
                //                 margin: EdgeInsets.only(top: 30),
                //                 child: Text(
                //                   "Réduction de 10% pour chaque réservation effectuée avec VALET CLUB. ",
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               Container(
                //                 padding: EdgeInsets.only(top: 5),
                //                 width: 100,
                //                 height: 30,
                //                 child: MaterialButton(
                //                     shape: RoundedRectangleBorder(
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     color: Colors.black,
                //                     child: Text(
                //                       "Explore",
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                     onPressed: () {}),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       Container(
                //         margin: EdgeInsets.only(top: 200),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               width: 20,
                //               height: 20,
                //               padding: EdgeInsets.all(0),
                //               child: MaterialButton(
                //                   padding: EdgeInsets.all(0),
                //                   shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(500)),
                //                   // color: Colors.red,
                //                   child: isIconSwitched
                //                       ? Icon(Icons.circle_rounded)
                //                       : Icon(Icons.circle_outlined),
                //                   // child: Icon(
                //                   //   ic1,
                //                   //   size: 20,
                //                   // ),
                //                   onPressed: () {
                //                     setState(() {
                //                       isIconSwitched = !isIconSwitched;
                //                       isIconSwitched1 = false;
                //                       isIconSwitched2 = false;
                //                     });
                //                     // _resetIconState("1");
                //                   }),
                //             ),
                //             Container(
                //               width: 20,
                //               height: 20,
                //               padding: EdgeInsets.all(0),
                //               child: MaterialButton(
                //                   shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(500)),
                //                   padding: EdgeInsets.all(0),
                //                   child: isIconSwitched1
                //                       ? Icon(Icons.circle_rounded)
                //                       : Icon(Icons.circle_outlined),
                //                   //  Icon(
                //                   //   ic2,
                //                   //   size: 20,
                //                   // ),
                //                   onPressed: () {
                //                     setState(() {
                //                       isIconSwitched1 = !isIconSwitched1;
                //                       isIconSwitched = false;
                //                       isIconSwitched2 = false;
                //                     });
                //                     // _resetIconState("2");
                //                   }),
                //             ),
                //             Container(
                //               width: 20,
                //               height: 20,
                //               padding: EdgeInsets.all(0),
                //               child: MaterialButton(
                //                   padding: EdgeInsets.all(0),
                //                   shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(500)),
                //                   child: isIconSwitched2
                //                       ? Icon(Icons.circle_rounded)
                //                       : Icon(Icons.circle_outlined),
                //                   //  Icon(
                //                   //   ic3,
                //                   //   size: 20,
                //                   // ),
                //                   onPressed: () {
                //                     setState(() {
                //                       isIconSwitched2 = !isIconSwitched2;
                //                       isIconSwitched = false;
                //                       isIconSwitched1 = false;
                //                     });
                //                     // _resetIconState("3");
                //                   }),
                //             )
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                //Filtrage

                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    "Popular Places",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        child: Text("102 Partners"),
                      ),
                      // Form(
                      //   child: TextFormField(),
                      // )
                    ],
                  ),
                ),

                //CARDS
                Container(
                  height: 215,
                  width: 500,
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          // height: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5, top: 10),
                                    child: Image.asset(
                                      'images/Rectangle.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15, left: 55),
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Ouvert",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 5),
                                      height: 30,
                                      child:
                                          Image.asset("images/Rectangle.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(15),
                                      height: 30,
                                      child:
                                          Image.asset("images/Rectangle.png"),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 15),
                                      height: 30,
                                      child:
                                          Image.asset("images/Rectangle.png"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, left: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Chfinja masters",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.add_location),
                                            ),
                                            Container(
                                              width: 140,
                                              child: Text(
                                                "9 Rue lamia bourgone Casablanca",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                            "images/Rectangle1.png"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 18,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.call),
                                      ),
                                      Container(
                                        child: Text("0646436078"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
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
                                  width: 200,
                                  child: Text(
                                    "Chfinja MASTERS, est un café restaurant. Cadre Chic et chaleureux ce café s’est recentré sur le bien être de ces clients. ",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  // width: 200,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.access_time),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text("12:00-25:00"),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: Icon(
                                          Icons.share,
                                        ),
                                      ),
                                      InkWell(
                                          child: isIconSwitched4
                                              ? Icon(
                                                  Icons.favorite_rounded,
                                                  size: 25,
                                                  color: Colors.red,
                                                )
                                              : Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  size: 25,
                                                ),
                                          onTap: () {
                                            setState(() {
                                              isIconSwitched4 =
                                                  !isIconSwitched4;
                                            });
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  height: 215,
                  width: 500,
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          // height: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5, top: 10),

                                    child: Image.asset(
                                      'images/Rectangle.png',
                                      fit: BoxFit.cover,
                                    ),
                                    // decoration: BoxDecoration(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(10)),
                                    //   image: DecorationImage(
                                    //       image: AssetImage('images/Rectangle.jpg'),
                                    //       fit: BoxFit.cover),
                                    // ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15, left: 55),
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Ouvert",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 5),
                                      height: 30,
                                      child:
                                          Image.asset("images/Rectangle.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(15),
                                      height: 30,
                                      child:
                                          Image.asset("images/Rectangle.png"),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 15),
                                      height: 30,
                                      child:
                                          Image.asset("images/Rectangle.png"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, left: 5),
                          child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Chfinja masters",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.add_location),
                                            ),
                                            Container(
                                              width: 140,
                                              child: Text(
                                                "9 Rue lamia bourgone Casablanca",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                            "images/Rectangle1.png"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 18,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.call),
                                      ),
                                      Container(
                                        child: Text("0646436078"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
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
                                  width: 200,
                                  child: Text(
                                    "Chfinja MASTERS, est un café restaurant. Cadre Chic et chaleureux ce café s’est recentré sur le bien être de ces clients. ",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  // width: 200,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.access_time),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text("12:00-25:00"),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: Icon(
                                          Icons.share,
                                        ),
                                      ),
                                      InkWell(
                                          child: isIconSwitched3
                                              ? Icon(
                                                  Icons.favorite_rounded,
                                                  size: 25,
                                                  color: Colors.red,
                                                )
                                              : Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  size: 25,
                                                ),
                                          onTap: () {
                                            setState(() {
                                              isIconSwitched3 =
                                                  !isIconSwitched3;
                                            });
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
