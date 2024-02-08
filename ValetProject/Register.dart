import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/ValetProject/All.dart';
import 'package:login_signup/ValetProject/Login.dart';
import 'package:login_signup/ValetProject/map.dart';
import 'package:path/path.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

dynamic snack_name;

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obs = true;
  bool check = true;
  Icon ic = Icon(Icons.visibility_off);

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController phone = TextEditingController();
  CollectionReference Collection =
      FirebaseFirestore.instance.collection("Collection");
  File? file;
  String? url;
  // String emailAddress = "";
  // String password = "";
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return Collection.add({
      'id': FirebaseAuth.instance.currentUser?.uid,
      'nom': nomController.text,
      'email': emailController.text, // John Doe
      'prenom': prenomController.text,
      'password': passwordController.text,
      'url': url ?? "none"
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //upload Images

  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.camera);
    // final XFile? imageCamera =
    //     await picker.pickImage(source: ImageSource.camera);
    if (imageGallery != null) {
      file = File(imageGallery!.path);
      var imageName = basename(imageGallery!.path);
      var refStorage = FirebaseStorage.instance.ref(imageName);
      await refStorage.putFile(file!);
      url = await refStorage.getDownloadURL();
    }
    setState(() {});
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
          color: Colors.black,
          child: ListView(children: [
            Column(
              children: [
                Container(
                  width: 500,
                  padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 30,
                  ),
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/vc.png'),
                ),
                Container(
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

                          controller: nomController,
                          // cursorWidth: 100,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(77, 158, 158, 158),
                              hintText: "Entrez votre nom",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              labelText: "Nom",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
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
                          style: TextStyle(color: Colors.white),
                          controller: prenomController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(77, 158, 158, 158),
                              hintText: "Entrez votre prenom",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              labelText: "Prenom",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
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
                          style: TextStyle(color: Colors.white),

                          controller: emailController,
                          // cursorWidth: 100,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(77, 158, 158, 158),
                              hintText: "Entrez votre adress e-mail",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              labelText: "Adress e-mail",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
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
                                  vertical: 5, horizontal: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                      ),
                      //--------------------------------------------------

                      Container(
                        // margin: EdgeInsets.only(top: 20),
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, left: 13, right: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(77, 158, 158, 158),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                    Size(100.0, 58.0),
                                  ),
                                  // backgroundColor: Colors.black,
                                  side: MaterialStateProperty.all(
                                    BorderSide(color: Colors.blue),
                                  ),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  if (url != null)
                                    Text(
                                      "Image Uploaded",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 15),
                                    )
                                  else
                                    Text(
                                      "No Image Uploaded",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                ],
                              ),
                              onPressed: () {
                                getImage();
                              }),
                        ),
                      ),

                      //--------------------------------------------------

                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: MaterialButton(
                                  child: Text(
                                    "Plus tard",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'otp1');
                                  }),
                            ),
                            SizedBox(
                              width: 195,
                            ),
                            Container(
                              child: MaterialButton(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                    snack_name = SnackBar(
                                      content: Text("the account created"),
                                    );
                                    print(credential);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print(
                                          'The password provided is too weak.');
                                      snack_name = SnackBar(
                                        content: Text(
                                            "The password provided is too weak."),
                                      );
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                      snack_name = SnackBar(
                                        content: Text(
                                            "The account already exists for that email."),
                                      );
                                    }
                                  } catch (e) {
                                    print(e);
                                    snack_name = SnackBar(
                                      content: Text(e.toString()),
                                    );
                                  }
                                  addUser();
                                  // snack_name = SnackBar(
                                  //   content: Text("the account crated"),
                                  // );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snack_name);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 50),
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
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                )
              ],
            )
          ])),
    );
  }
}
