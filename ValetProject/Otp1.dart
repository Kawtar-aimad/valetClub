import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:login_signup/ValetProject/All.dart';
import 'package:login_signup/ValetProject/Otp2.dart';

class Otp1 extends StatefulWidget {
  const Otp1({super.key});

  @override
  State<Otp1> createState() => _Otp1State();
}

class _Otp1State extends State<Otp1> {
  bool status = false;
  final TextEditingController phoneController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  void PhoneAuth() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
                  Otp2(verificationId: verificationId)));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print('Error : $e');
    }
  }

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
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/vc.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                          "Entrez votre numéro de téléphone",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: IntlPhoneField(
                    controller: phoneController,
                    dropdownTextStyle: TextStyle(color: Colors.white),
                    initialCountryCode: 'MA',
                    style: TextStyle(color: Colors.white),
                    // cursorWidth: 100,
                    decoration: InputDecoration(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          child: Checkbox(
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value!;
                          });
                        },
                      )),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "En créant un compte, vous acceptez nos",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Termes et conditions",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 130,
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue,
                      minWidth: 200,
                      height: 50,
                      child: Text(
                        "Suivant",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        PhoneAuth();
                        // Navigator.pushNamed(context, "otp2");
                      },
                    ))
              ],
            )
          ])),
    );
  }
}
