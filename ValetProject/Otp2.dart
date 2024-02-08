import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:login_signup/ValetProject/All.dart';

class Otp2 extends StatefulWidget {
  final String verificationId;
  const Otp2({super.key, required this.verificationId});

  @override
  State<Otp2> createState() => _Otp2State();
}

class _Otp2State extends State<Otp2> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController codeController = TextEditingController();
  bool status = false;
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
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      // decoration: TextDecoration.underline,
                      // decorationColor: Colors.white
                    ),
                  ),
                ),
                Container(
                  height: 3,
                  width: 159,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Verifiez votre téléphone",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Wrap(
                            children: [
                              Container(
                                child: Text(
                                  "Vous allez recevoir un SMS avec un code de verification sur +212 646436078",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "otp1");
                                },
                                child: Text(
                                  "Modifiez votre numéro",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: codeController,
                    style: TextStyle(color: Colors.white),

                    // cursorWidth: 100,
                    decoration: InputDecoration(
                        hintText: "Entrez le code",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIconColor: Colors.white,
                        filled: true,
                        fillColor: const Color.fromARGB(77, 158, 158, 158),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue,
                      minWidth: 200,
                      height: 50,
                      child: Text(
                        "Valider",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onPressed: () async {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.verificationId,
                                smsCode: codeController.text);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        if (auth.currentUser?.uid != null) {
                          Navigator.pushNamed(context, "map");
                        }
                        ;
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "Renvoyez le code",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 2,
                  width: 80,
                )
              ],
            )
          ])),
    );
  }
}
