import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'wordDescription.dart';

//import '../word.dart';
//import '../wordList.dart';

class WordPage extends StatefulWidget {
  final String categoryName;
  WordPage({this.categoryName});

  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
//  List<Word> wordsForSelectedCategory = [];
  List<DocumentSnapshot> wordsForSelectedCategory = [];

//  List<String> singularArticles = [];
//  List<String> singularWords = [];
//  List<String> pluralArticles = [];
//  List<String> pluralWords = [];
//
//  @override
//  void initState() {
//    for (int i = 0; i < wordList.length; i++) {
//      if (wordList[i].categories.contains(widget.categoryName)) {
//        wordsForSelectedCategory.add(wordList[i]);
//      }
//    }
//    for (int i = 0; i < wordsForSelectedCategory.length; i++) {
//      for (String j in wordsForSelectedCategory[i].singular.keys) {
//        singularArticles.add(j);
//      }
//      for (String j in wordsForSelectedCategory[i].singular.values) {
//        singularWords.add(j);
//      }
//      for (String j in wordsForSelectedCategory[i].plural.keys) {
//        pluralArticles.add(j);
//      }
//      for (String j in wordsForSelectedCategory[i].plural.values) {
//        pluralWords.add(j);
//      }
//    }
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName[0].toUpperCase() +
            widget.categoryName.substring(1)),
        backgroundColor: Colors.black,
      ),
      body: _buildBody(context),
//      body: ListView.builder(
//        itemCount: wordsForSelectedCategory.length,
//        itemBuilder: (context, index) => Card(
//          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//          child: ListTile(
//            leading: Row(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Container(child: wordsForSelectedCategory[index].image),
//                SizedBox(
//                  width: 10.0,
//                ),
//                Container(
//                  width: 3.0,
//                  height: 50.0,
//                  color: Colors.grey[200],
//                )
//              ],
//            ),
//            title: Center(
//              child: Text(
//                wordsForSelectedCategory[index].englishWord,
//                style: TextStyle(
//                  fontSize: 20.0,
//                ),
//              ),
//            ),
//            subtitle: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Text(singularWords[index] + ' : '),
//                    Text(singularArticles[index]),
//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                    Text(pluralWords[index] + ' : '),
//                    Text(pluralArticles[index]),
//                  ],
//                )
//              ],
//            ),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => WordDescription(
//                          word: wordsForSelectedCategory[index])));
//            },
//          ),
//        ),
//      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('word_list').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    wordsForSelectedCategory = [];
    for (var data in snapshot) {
      if (data['categories'].contains(widget.categoryName)) {
        wordsForSelectedCategory.add(data);
      }
    }
//    print(wordsForSelectedCategory);
    return ListView(
      children: wordsForSelectedCategory
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(child: Image.asset('images/sadness.jpg')),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: 3.0,
              height: 50.0,
              color: Colors.grey[200],
            )
          ],
        ),
        title: Center(
          child: Text(
            data['english_word'],
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(data['singular_word'] + ' : '),
                Text(data['singular_article']),
              ],
            ),
            Row(
              children: <Widget>[
                Text(data['plural_word'] + ' : '),
                Text(data['plural_article']),
              ],
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => WordDescription(
//                        word: data.documentID,
                        word: data,
                      )));
        },
      ),
    );
  }
}
