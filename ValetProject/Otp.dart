import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/ValetProject/All.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button globally
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.black,
          child: ListView(children: [
            Column(
              children: [
                Container(
                  width: 500,
                  padding: EdgeInsets.all(40),
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/vc.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "La meilleure façon de se connecter avec",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Text(
                          "votre valet",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            minimumSize: MaterialStateProperty.all(
                              Size(500.0, 58.0),
                            ),
                            // backgroundColor: Colors.black,
                            side: MaterialStateProperty.all(
                              BorderSide(color: Colors.blue),
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Continuez avec votre numéro de téléphone",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "otp1");
                        }),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150, left: 50),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Avez vous déjà un compte?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                        child: Text(
                          "Se connecter",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ])),
    );
  }
}
