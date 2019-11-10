//import 'dart:io';

import 'package:deutsch_notes/screens/categoryAlert.dart';
import 'package:flutter/material.dart';

import '../category.dart';
import '../setImage.dart';
import '../word.dart';
import '../wordList.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  List<Category> formCategoryList = [];
  List<String> wordCategoryList = [];

  TextEditingController englishWord = new TextEditingController();
  TextEditingController singularArticle = new TextEditingController();
  TextEditingController singularWord = new TextEditingController();
  TextEditingController pluralArticle = new TextEditingController();
  TextEditingController pluralWord = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> optionsList = ['Reset'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Word'),
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: (String value) {
                setState(() {});
              },
              onCanceled: null,
              itemBuilder: (BuildContext context) =>
                  optionsList.map<PopupMenuItem<String>>((String value) {
                    return PopupMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.grey),
                      ),
                      value: value,
                    );
                  }).toList()),
        ],
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: formCategoryList.length + 1,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Colors.white, width: 3.0),
                      color: Colors.amber,
                    ),
                    alignment: Alignment.center,
                    child: (index == formCategoryList.length)
                        ? InkWell(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Icon(
                              Icons.add,
                              size: 20.0,
                            ),
                            onTap: () async {
                              var x = await _asyncFormCategoryList(context);
                              if (x != null) {
                                setState(() {
                                  formCategoryList = x;
                                });
                              }
                            },
                          )
                        : Container(
                            child: Text(formCategoryList[index].categoryName),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  border: Border.all(width: 1.0, color: Colors.grey),
                ),
                child: SetImage(
                  noneSelectedType: SetImage.NONESELECTEDIMAGE,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                controller: englishWord,
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.amber)),
                  border: OutlineInputBorder(),
                  labelText: 'English  Word',
                  labelStyle: TextStyle(color: Colors.red),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: singularArticle,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.amber)),
                        border: OutlineInputBorder(),
                        labelText: 'Singular Article',
                        labelStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: singularWord,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.amber)),
                        border: OutlineInputBorder(),
                        labelText: 'German  Word',
                        labelStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: pluralArticle,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.amber)),
                        border: OutlineInputBorder(),
                        labelText: 'Plural Article',
                        labelStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: pluralWord,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.amber)),
                        border: OutlineInputBorder(),
                        labelText: 'German  Word',
                        labelStyle: TextStyle(color: Colors.red[700]),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                padding: EdgeInsets.all(5.0),
                onPressed: () {
                  for (int i = 0; i < formCategoryList.length; i++) {
                    wordCategoryList.add(formCategoryList[i].categoryName);
                  }
                  if (_formKey.currentState.validate()) {
//                    Scaffold.of(context).showSnackBar(
//                        SnackBar(content: Text('Processing Data')));
                    wordList.add(
                      Word(
                          categories: wordCategoryList,
                          englishWord: englishWord.text,
                          singular: {singularArticle.text: singularWord.text},
                          plural: {pluralArticle.text: pluralWord.text},
                          image: Image.asset('images/sadness.jpg')),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
                color: Colors.red[700],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Category>> _asyncFormCategoryList(BuildContext context) async {
    return showDialog<List<Category>>(
        context: context,
        builder: (BuildContext context) {
          return CategoryAlert(formCategoryList);
        });
  }
}
