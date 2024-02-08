import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Image1 extends StatefulWidget {
  const Image1({super.key});

  @override
  State<Image1> createState() => _Image1State();
}

class _Image1State extends State<Image1> {
  File? file;
  String? url;
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
      body: Container(
        child: Column(children: [
          MaterialButton(
              child: Text("get image"),
              onPressed: () {
                getImage();
              }),
          if (url != null)
            Image.network(
              url!,
            )
        ]),
      ),
    );
  }
}
