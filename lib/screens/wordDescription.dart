import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import '../word.dart';

class WordDescription extends StatelessWidget {
//  final Word word;
//  final String word;
  final DocumentSnapshot word;
  Map wordData;
  List es = [];
  WordDescription({this.word}) {
    wordData = word.data;
    es = wordData['example_sentances'];
//    print(es[0]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wordData['english_word']),
//        title: word['english_word'],
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/sadness.jpg',
            height: 300.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(wordData['singular_article'] + ' : ',
//                word.singular.keys.toList()[0] + ' : ',
                  style: TextStyle(fontSize: 40.0)),
              Text(
                wordData['singular_word'],
//                word.singular.values.toList()[0],
                style: TextStyle(fontSize: 40.0),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                wordData['plural_article'] + ' : ',
//                word.plural.keys.toList()[0] + ' : ',
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                wordData['plural_word'],
//                word.plural.values.toList()[0],
                style: TextStyle(fontSize: 40.0),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0),
            width: 300.0,
            height: 300,
            child: ListView.builder(
              itemCount: es.length,
              itemBuilder: (context, index) => Text(
                (index + 1).toString() + ') ' + es[index],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w100,
                    wordSpacing: 5.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
