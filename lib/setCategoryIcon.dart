//import 'dart:io';
//
//import 'package:flutter/material.dart';
//import 'package:flutter_image_compress/flutter_image_compress.dart';
//import 'package:image_cropper/image_cropper.dart';
//import 'package:image_picker/image_picker.dart';
//
//class SetCategoryIcon extends StatefulWidget {
//  @override
//  _SetCategoryIconState createState() => _SetCategoryIconState();
//}
//
//class _SetCategoryIconState extends State<SetCategoryIcon> {
//  static List<String> imageOptions = ['fileImage', 'none'];
//  String imageSet = imageOptions[1];
//  int currentImageOption;
//
//  File _image;
//  File croppedFile;
//  File result;
//
//  Future getImageFromCamera() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//    if (image != null) {
//      croppedFile = await ImageCropper.cropImage(
//        sourcePath: image.path,
//        aspectRatioPresets: [
//          CropAspectRatioPreset.square,
//        ],
//        androidUiSettings: AndroidUiSettings(
//          toolbarTitle: 'Crop Image',
//          toolbarColor: Colors.red[700],
//          toolbarWidgetColor: Colors.white,
//          statusBarColor: Colors.red[700],
//          activeControlsWidgetColor: Colors.red[700],
//          initAspectRatio: CropAspectRatioPreset.square,
//        ),
//      );
//    }
//    if (croppedFile != null) {
//      result = await FlutterImageCompress.compressAndGetFile(
//        croppedFile.path,
//        croppedFile.path,
//        quality: 88,
//      );
//      _image = result;
//    }
//    setState(() {
//      if (image == null || croppedFile == null) {
//        imageSet = imageOptions[currentImageOption];
//      }
//    });
//  }
//
//  Future getImageFromGallery() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//    if (image != null) {
//      croppedFile = await ImageCropper.cropImage(
//        sourcePath: image.path,
//        aspectRatioPresets: [
//          CropAspectRatioPreset.square,
//        ],
//        androidUiSettings: AndroidUiSettings(
//          toolbarTitle: 'Crop Image',
//          toolbarColor: Colors.red[700],
//          toolbarWidgetColor: Colors.white,
//          statusBarColor: Colors.red[700],
//          activeControlsWidgetColor: Colors.red[700],
//          initAspectRatio: CropAspectRatioPreset.square,
//        ),
//      );
//    }
//    if (croppedFile != null) {
//      result = await FlutterImageCompress.compressAndGetFile(
//        croppedFile.path,
//        croppedFile.path,
//        quality: 88,
//      );
//      _image = result;
//    }
//    setState(() {
//      if (image == null || croppedFile == null) {
//        imageSet = imageOptions[currentImageOption];
//      }
////      else {
////        _image = image;
////      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return imageSet == imageOptions[0] ? fileImage() : noneSelected();
//  }
//
//  Widget fileImage() {
//    currentImageOption = 0;
//    return Padding(
//      padding: const EdgeInsets.all(5.0),
//      child: InkWell(
//          child: Image.file(
//            _image,
//          ),
//          onLongPress: () {
//            return showDialog(
//                context: context, builder: (BuildContext context) => alert());
//          }),
//    );
//  }
//
//  Widget noneSelected() {
//    currentImageOption = 1;
//    return InkWell(
//      child: Image.asset('images/sadness.jpg'),
//      onLongPress: () {
//        return showDialog(
//            context: context, builder: (BuildContext context) => alert());
//      },
//    );
//  }
//
//  Widget alert() {
//    return AlertDialog(
//      content: Container(
//        child: Row(
//          children: <Widget>[
//            Expanded(
//              child: InkWell(
//                  child: Icon(Icons.photo_camera),
//                  onTap: () {
//                    imageSet = imageOptions[0];
//                    Navigator.of(context).pop();
//                    getImageFromCamera();
//                  }),
//            ),
//            Expanded(
//              child: InkWell(
//                child: Icon(Icons.insert_photo),
//                onTap: () {
//                  imageSet = imageOptions[0];
//                  Navigator.of(context).pop();
//                  getImageFromGallery();
//                },
//              ),
//            ),
//            Expanded(
//              child: InkWell(
//                child: Icon(Icons.delete_outline),
//                onTap: () {
//                  setState(() {
//                    imageSet = imageOptions[1];
//                    Navigator.of(context).pop();
//                  });
//                },
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
