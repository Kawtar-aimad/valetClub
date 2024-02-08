import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/ValetProject/All.dart';
import 'package:login_signup/ValetProject/map.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController()
    ..text = "kawtaraimad@gmail.com";
  final TextEditingController passwordController = TextEditingController()
    ..text = "123456";

  bool obs = true;
  bool check = true;
  Icon ic = Icon(Icons.visibility_off);
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> getUsers() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.toString().trim(),
        password: passwordController.text.toString().trim(),
      );

      // If signInWithEmailAndPassword succeeds, the user exists.
      print('User exists');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // If signInWithEmailAndPassword fails with 'user-not-found', the user doesn't exist.
        print('User does not exist');
      } else {
        print('Error: $e');
      }
    }
    // ScaffoldMessenger.of(context).showSnackBar(snack_name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(""),
      //   backgroundColor: Colors.black,
      // ),
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
                  margin: EdgeInsets.only(top: 50),
                  child: Form(
                      child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),

                          controller: emailController,
                          // cursorWidth: 100,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(77, 158, 158, 158),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              labelText: "Adresse Email",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: obs,
                          style: TextStyle(color: Colors.white),
                          // cursorWidth: 100,
                          decoration: InputDecoration(
                              suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (check == true) {
                                        obs = true;
                                        ic = Icon(Icons.visibility_off);
                                        check = false;
                                      } else {
                                        obs = false;
                                        ic = Icon(Icons.visibility);
                                        check = true;
                                      }
                                    });
                                  },
                                  icon: ic),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(77, 158, 158, 158),
                              hintText: "Mot de pass",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              labelText: "Mot de pass",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Connexion",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            color: Colors.blue,
                            minWidth: 280,
                            height: 50,
                            onPressed: () {
                              getUsers();
                              // Navigator.pushNamed(context, "All");
                            }),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Ou connectez-vous avec",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.purple,
                            ),
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Poursuivre avec N° de tél",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/");
                                }),
                          ],
                        ),
                      ),
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "register");
                          }),
                    ],
                  )),
                )
              ],
            )
          ])),
    );
  }
}
