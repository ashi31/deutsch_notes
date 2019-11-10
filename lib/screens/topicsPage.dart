import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Drawer/drawerPage.dart';
import '../setImage.dart';
import 'formPage.dart';
import 'wordPage.dart';

class TopicsPage extends StatefulWidget {
  final String title;

  TopicsPage({this.title});

  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    int searchIcon = typing ? 5 : 3;
    IconButton searchIconButton = IconButton(
      icon: Image.asset('images/searchIcon/search$searchIcon.png'),
      onPressed: () {
        setState(() {
          typing = !typing;
        });
      },
    );

    return Scaffold(
      drawer: (typing != true) ? DrawerPage() : null,
      appBar: AppBar(
        title: (typing == true)
            ? TextField(
                decoration: InputDecoration(
                    hintText: 'Search Topic',
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: searchIconButton),
                autofocus: true,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(widget.title),
                  searchIconButton,
                ],
              ),
        backgroundColor: (typing == true) ? Colors.white : Colors.black,
        elevation: 30.0,
      ),
      body: Container(
        child: _buildBody(context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[700],
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => FormPage()));
        },
        child: Icon(Icons.add),
        shape: GuestShape(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber[400],
        child: Container(
          height: 60.0,
        ),
//        shape: AutomaticNotchedShape(GuestShape()),
        shape: HostShape(),
        notchMargin: 12.0,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('category_list').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );

    //  return ListView.builder(
//      itemCount: categoryList.length,
//      itemBuilder: (context, index) => Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Card(
//              child: ListTile(
//                leading: Row(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Container(
//                      child: SetImage(
//                        noneSelected: SetImage.NONESELECTEDICON,
//                      ),
//                    ),
//                    SizedBox(
//                      width: 10.0,
//                    ),
//                    Container(
//                      width: 3.0,
//                      height: 50.0,
//                      color: Colors.grey[200],
//                    )
//                  ],
//                ),
//                title: Center(
//                  child: Text(
//                    categoryList[index].categoryName,
//                    style: TextStyle(
//                      fontSize: 30.0,
//                      fontWeight: FontWeight.w500,
//                      letterSpacing: 5.0,
//                      color: Colors.black,
//                    ),
//                  ),
//                ),
//                onTap: () {
//                  Navigator.of(context).push(MaterialPageRoute(
//                      builder: (context) => WordPage(
//                          categoryName: categoryList[index].categoryName)));
//                },
//              ),
//            ),
//          ));
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: SetImage(
                  noneSelectedType: SetImage.NONESELECTEDICON,
                ),
              ),
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
              data['category_name'],
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 5.0,
                color: Colors.black,
              ),
            ),
          ),
          onTap: () {
//            print(data.documentID);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WordPage(categoryName: data.documentID)));
          },
        ),
      ),
    );
  }
}

class HostShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect guest) {
    Rect intersection = host.intersect(guest);
    return Path()
      ..lineTo(intersection.left - 5, intersection.top)
      ..lineTo(intersection.left + guest.width / 2, intersection.height + 5)
      ..lineTo(intersection.left + guest.width + 5, intersection.top)
      ..lineTo(host.width, 0.0)
      ..lineTo(host.width, host.height)
      ..lineTo(0.0, host.height)
//      ..lineTo(intersection.left + guest.width / 2, intersection.height + 10.0)
//      ..lineTo(intersection.right + 10.0, intersection.top)
//      ..lineTo(host.width, 0.0)
      ..close();
  }
}

class GuestShape extends ShapeBorder {
  const GuestShape();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2, rect.top - 8)
      ..lineTo(rect.right + 8, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom + 8)
      ..lineTo(rect.left - 8, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
