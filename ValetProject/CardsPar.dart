import 'package:flutter/material.dart';

class CardsPar extends StatelessWidget {
  const CardsPar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 350,
      child: Card(
        // color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: 280,
                  child: Image.asset(
                    "images/rec.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  margin: EdgeInsets.only(top: 105, left: 5),
                  padding: EdgeInsets.only(right: 5),
                  width: 280,
                  height: 45,
                  child: Text(
                    "Concert & Festival",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Megarama",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          "Nous mettons en place un point de rencontre pour les voituriers à proximité, permettant aux spectateur d'accéder facilement à l'exposition sur le patrimoine spectacle.",
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Image.asset("images/Rectangle1.png"),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.add_location,
                      size: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "Ain diab casablanca",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Icon(Icons.access_time),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "12 : 00 - 23 : 00",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text("Prix Ticket"),
                          ),
                          Container(
                            child: Text(
                              "400 DHS",
                              style: TextStyle(color: Colors.purple),
                            ),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 150),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text("Prix volet"),
                          ),
                          Container(
                            child: Text(
                              "400 DHS",
                              style: TextStyle(color: Colors.purple),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 20),
              child: Row(
                children: [
                  Container(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.green,
                      child: Text(
                        "Valet disponaible",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Icon(
                      Icons.call,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      "0646436078",
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
