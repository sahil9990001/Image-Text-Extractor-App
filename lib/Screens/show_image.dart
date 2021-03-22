import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/services.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({
    Key key,
    @required this.image,
  }) : super(key: key);
  final File image;

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  String extractedText = 'Your Text will Display here...';

  performImageLebeling() async {
    final FirebaseVisionImage firebaseVisionImage =
        FirebaseVisionImage.fromFile(widget.image);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await recognizer.processImage(firebaseVisionImage);
    extractedText = '';
    setState(() {
      for (TextBlock block in visionText.blocks) {
        // final String txt = block.text;
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            extractedText += element.text + ' ';
          }
        }
        extractedText += '\n';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translation'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
              // color: Colors.pink,
              image: DecorationImage(
                  image: AssetImage('assets/translation_bg.jpeg'),
                  fit: BoxFit.cover)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  // width: 400,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/download1.jpg',
                          height: 250,
                          width: 240,
                        ),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 10.0),
                            // child: Text('Hello'),
                            child: Column(
                              children: [
                                widget.image != null
                                    ? Image.file(
                                        widget.image,
                                        width: 140,
                                        height: 180,
                                        fit: BoxFit.fill,
                                      )
                                    : Container(
                                        child: Text(
                                            'Select Image To Extract Text'),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FloatingActionButton.extended(
                                    // color: Colors.blue,
                                    onPressed: () {
                                      performImageLebeling();
                                      // Navigator.of(context).pop();
                                    },
                                    label: const Text('Extract Text'),
                                    tooltip: 'Click To Extract Text',
                                    icon: Icon(
                                      Icons.emoji_emotions_outlined,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage('assets/note.jpeg'),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.only(bottom: 5, left: 20, right: 10),
                height: 300,
                width: 250,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      extractedText,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton.icon(
                  color: Colors.teal,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: extractedText));
                    // snackBar();
                  },
                  label: Text('Copy Extracted Text',
                      style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.copy, color: Colors.white),
                  textColor: Colors.white,
                  splashColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ExtractText extends StatelessWidget {
//   ExtractText({
//     Key key,
//     @required this.image,
//   }) : super(key: key);
//   String MyText = 'Sahil';
//   File image;
//   performImageLebeling() async {
//     final FirebaseVisionImage firebaseVisionImage =
//         FirebaseVisionImage.fromFile(image);
//     final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
//     VisionText visionText = await recognizer.processImage(firebaseVisionImage);
//     MyText = '';

//     for (TextBlock block in visionText.blocks) {
//       final String txt = block.text;
//       for (TextLine line in block.lines) {
//         for (TextElement element in line.elements) {
//           MyText += element.text + ' ';
//         }
//       }
//       MyText += '\n';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             performImageLebeling(),
//             Text(
//               MyText,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                   color: Colors.purple,
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
