//import 'package:flutter/material.dart';
//import 'categoryList.dart';
import 'package:flutter/material.dart';

class Word {
  List<String> categories;
  Image image;
  String englishWord;
  Map<String, String> singular;
  Map<String, String> plural;
  Word(
      {this.categories,
      this.image,
      this.englishWord,
      this.singular,
      this.plural});
}

//PopupMenuButton<String>(
//onSelected: (String value) {
//setState(() {});
//},
//onCanceled: null,
//itemBuilder: (BuildContext context) => ['URL', 'File']
//.map<PopupMenuItem<String>>((String value) {
//return PopupMenuItem(
//child: Text(
//value,
//style: TextStyle(
//fontWeight: FontWeight.w700,
//color: Colors.grey),
//),
//value: value,
//);
//}).toList())
