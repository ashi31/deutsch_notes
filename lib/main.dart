import 'package:flutter/material.dart';

import 'screens/topicsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deutsch Notes',
      home: TopicsPage(title: 'Topics'),
//      home: Test(),
//      home: MyHomePage(),
    );
  }
}
