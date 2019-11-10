import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30.0,
      child: Column(children: <Widget>[
        SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 30.0, right: 30.0, bottom: 0.0),
                  child: Card(
                    shape: CircleBorder(),
                    elevation: 10.0,
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'images/profile/ashita.jpg',
                            ),
                            radius: 47.0,
                          ),
                          backgroundImage:
                              AssetImage('images/profile/disk.png'),
                          backgroundColor: Colors.blue,
                          radius: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Ashita Gupta',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Quicksand'),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'riyaashita@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Quicksand',
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                  child: Center(
                      child: Text(
                    '+91-7980-773-591',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Quicksand',
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.black,
          child: ListTile(
            title: Text(
              'Topic1',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Card(
          color: Colors.red,
          child: ListTile(
            title: Text(
              'Topic2',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Card(
          color: Colors.amber,
          child: ListTile(
            title: Text(
              'Topic3',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
