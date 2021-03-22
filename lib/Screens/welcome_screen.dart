import 'package:flutter/material.dart';
import 'package:image_text_converter/Screens/home_drawer.dart';
import 'package:image_text_converter/Screens/show_image.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  File image;
  ImagePicker imagePicker;

  pickImageFromGallery() async {
    PickedFile pickedFile = await imagePicker.getImage(
      source: ImageSource.gallery,
    );

    image = File(pickedFile.path);

    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ShowImage(image: image)));
    });
  }

  captureImageWithCamera() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.camera);

    image = File(pickedFile.path);

    setState(() {
      // image = File(pickedFile.path);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ShowImage(image: image)));
    });
  }

  Size displaySize(BuildContext context) {
    // debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  @override
  void initState() {
    super.initState();

    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: HomeDrawer(captureImageWithCamera, pickImageFromGallery),
        appBar: AppBar(
          title: Text(
            'Text Extractor',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgimage.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Color(0xFF60E015).withOpacity(0.5), BlendMode.darken),
              ),
            ),

            width: displaySize(context).width,
            height: displaySize(context).height,
            // color: Colors.pink.shade100,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Select Source of Image To Select..',
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: displaySize(context).width * 0.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: FittedBox(
                      child: FloatingActionButton.extended(
                        heroTag: "btn1",
                        // backgroundColor: Colors.pink.shade400,
                        onPressed: pickImageFromGallery,
                        label: const Text('Gallery'),
                        tooltip: 'Select Image from Gallery',
                        icon: Icon(
                          Icons.image,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: FittedBox(
                    child: FloatingActionButton.extended(
                      heroTag: "btn2",
                      onPressed: captureImageWithCamera,
                      label: const Text('Camera'),
                      tooltip: 'Select Image from Camera',
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
