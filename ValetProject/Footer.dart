import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.black,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "map");
          },
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
        )),
        SizedBox(
          width: 60,
        ),
        Container(
            child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "All");
          },
          icon: Icon(
            Icons.diversity_2,
            color: Colors.white,
          ),
        )),
        SizedBox(
          width: 60,
        ),
        Container(
            child: IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil("login", (route) => false);
          },
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )),
        SizedBox(
          width: 60,
        ),
        Container(
            child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "profil");
          },
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        )),
      ]),
    );
  }
}
