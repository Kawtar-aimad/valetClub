import 'package:flutter/material.dart';

class Sliders extends StatelessWidget {
  final String pic ;
  const Sliders({super.key, required this.pic});

  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      Container(
        width: 500.0,
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage(pic), fit: BoxFit.cover),
        ),
      ),
      Container(
        width: 500.0,
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.withOpacity(0.9),
                Colors.blue.withOpacity(0.0),
              ],
            )),
        child: Container(
          width: 500,
          height: 200,
          padding: EdgeInsets.only(left: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Offres de restauration ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Réduction de 10% pour chaque réservation effectuée avec VALET CLUB. ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: 100,
                height: 30,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.black,
                    child: Text(
                      "Explore",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
