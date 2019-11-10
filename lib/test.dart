import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
//          Card(
//            shape: CircleBorder(
//                side: BorderSide(
//              color: Colors.white,
//              width: 2.0,
//            )),
//            child: FloatingActionButton(
//              backgroundColor: Colors.red[700],
//              onPressed: () {},
//              child: Icon(Icons.add),
////            shape: GuestShape(),
//            ),
//          ),
          Container(
            decoration: ShapeDecoration(
                shape: CircleBorder(
                    side: BorderSide(width: 4.0, color: Colors.white))),
            child: FloatingActionButton(
              backgroundColor: Colors.red[700],
              onPressed: () {},
              child: Icon(Icons.add),
//            shape: GuestShape(),
            ),
          ),
          SizedBox(
            width: 50.0,
          ),
          Container(
            decoration: ShapeDecoration(
                shape: CircleBorder(
                    side: BorderSide(width: 4.0, color: Colors.white))),
            child: FloatingActionButton(
              backgroundColor: Colors.red[700],
              onPressed: () {},
              child: Icon(Icons.add),
//            shape: GuestShape(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber[400],
        child: Container(
          height: 60.0,
        ),
//        shape: AutomaticNotchedShape(GuestShape()),
//        shape: HostShape1(),
        notchMargin: 5.0,
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
      ..lineTo(
          intersection.left + guest.width / 4 - 10, intersection.height + 5)
      ..lineTo(intersection.left + guest.width / 2 - 15, intersection.top)
      ..lineTo(host.width / 2 + 15, 0.0)
      ..lineTo(guest.right - (guest.width / 4) + 10, intersection.height + 5)
      ..lineTo(guest.right + 5, intersection.top)
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
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
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

class HostShape1 extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect guest) {
    Rect intersection = host.intersect(guest);
    var pt = Offset(
        intersection.left + guest.width / 4 - 10, intersection.height + 5);
    var pt1 =
        Offset(intersection.left + guest.width / 2 - 15, intersection.top);
    var center1 = Offset(guest.left + 33, intersection.top);
    var center2 = Offset(guest.right - 33, intersection.top);
    return Path()
//      ..lineTo(intersection.left, intersection.top)
      ..addOval(Rect.fromCircle(center: center1, radius: 35.0))
//      ..quadraticBezierTo(pt.dx, pt.dy + 30,
//          intersection.left + guest.width / 2 - 15, intersection.top)
//      ..lineTo(
//          intersection.left + guest.width / 4 - 10, intersection.height + 5)
//      ..lineTo(intersection.left + guest.width / 2 - 15, intersection.top)
      ..lineTo(host.width / 2 + 15, 0.0)
      ..addOval(Rect.fromCircle(center: center2, radius: 35.0))
      ..lineTo(guest.right - (guest.width / 4) + 10, intersection.height + 5)
      ..lineTo(guest.right + 5, intersection.top)
      ..lineTo(host.width, 0.0)
      ..lineTo(host.width, host.height)
      ..lineTo(0.0, host.height)
      ..lineTo(0.0, 0.0)
//      ..lineTo(intersection.left + guest.width / 2, intersection.height + 10.0)
//      ..lineTo(intersection.right + 10.0, intersection.top)
//      ..lineTo(host.width, 0.0)
      ..close();
  }
}
