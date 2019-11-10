import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SetImage extends StatefulWidget {
//  File img;
  final int noneSelectedType;
  static int NONESELECTEDIMAGE = 1;
  static int NONESELECTEDICON = 2;

  SetImage({@required this.noneSelectedType});

  @override
  _SetImageState createState() => _SetImageState();
}

class _SetImageState extends State<SetImage> {
  static List<String> imageOptions = ['fileImage', 'none'];
  String imageSet = imageOptions[1];
  int currentImageOption;

  File _image;
  File croppedFile;
  File result;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.red[700],
          toolbarWidgetColor: Colors.white,
          statusBarColor: Colors.red[700],
          activeControlsWidgetColor: Colors.red[700],
          initAspectRatio: CropAspectRatioPreset.square,
        ),
      );
    }
    if (croppedFile != null) {
      result = await FlutterImageCompress.compressAndGetFile(
        croppedFile.path,
        croppedFile.path,
        quality: 88,
      );
      _image = result;
//      widget.img = _image;
    }
    setState(() {
      if (image == null || croppedFile == null) {
        imageSet = imageOptions[currentImageOption];
      }
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.red[700],
          toolbarWidgetColor: Colors.white,
          statusBarColor: Colors.red[700],
          activeControlsWidgetColor: Colors.red[700],
          initAspectRatio: CropAspectRatioPreset.square,
        ),
      );
    }
    if (croppedFile != null) {
      result = await FlutterImageCompress.compressAndGetFile(
        croppedFile.path,
        croppedFile.path,
        quality: 88,
      );
      _image = result;
//      widget.img = _image;
    }
    setState(() {
      if (image == null || croppedFile == null) {
        imageSet = imageOptions[currentImageOption];
      }
//      else {
//        _image = image;
//      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return imageSet == imageOptions[0]
        ? fileImage()
        : widget.noneSelectedType == SetImage.NONESELECTEDIMAGE
            ? noneSelectedImage()
            : noneSelectedCategoryIcon();
  }

  Widget fileImage() {
    currentImageOption = 0;
    return Padding(
      padding: EdgeInsets.all(
          widget.noneSelectedType == SetImage.NONESELECTEDICON ? 5.0 : 0.0),
      child: InkWell(
          child: Image.file(
            _image,
          ),
          onLongPress: () {
            return showDialog(
                context: context, builder: (BuildContext context) => alert());
          }),
    );
  }

  Widget noneSelectedImage() {
    currentImageOption = 1;
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 1.0,
        dashPattern: [5],
        borderType: BorderType.RRect,
        radius: Radius.circular(5.0),
        child: Center(
          child: FlatButton(
            onPressed: () {
              return showDialog(
                  context: context, builder: (BuildContext context) => alert());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 50.0,
                ),
                Center(
                  child: Text(
                    'Add Image',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget noneSelectedCategoryIcon() {
    currentImageOption = 1;
    return InkWell(
      child: Image.asset('images/sadness.jpg'),
      onLongPress: () {
        return showDialog(
            context: context, builder: (BuildContext context) => alert());
      },
    );
  }

  Widget alert() {
    return AlertDialog(
      content: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                  child: Icon(Icons.photo_camera),
                  onTap: () {
                    imageSet = imageOptions[0];
                    Navigator.of(context).pop();
                    getImageFromCamera();
                  }),
            ),
            Expanded(
              child: InkWell(
                child: Icon(Icons.insert_photo),
                onTap: () {
                  imageSet = imageOptions[0];
                  Navigator.of(context).pop();
                  getImageFromGallery();
                },
              ),
            ),
            Expanded(
              child: InkWell(
                child: Icon(Icons.delete_outline),
                onTap: () {
                  setState(() {
                    imageSet = imageOptions[1];
                    Navigator.of(context).pop();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
