import 'package:chess_flutter/components/place_widget.dart';
import 'package:chess_flutter/models/rock.dart';
import 'package:flutter/material.dart';

import 'models/elephent.dart';
import 'models/horse.dart';
import 'models/king.dart';
import 'models/qeen.dart';
import 'models/solider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _defaultList = [
    new Rock(0, "b"),
    new Elephent(1, "b"),
    new Horse(2, "b"),
    new Qeen(3, "b"),
    new King(4, "b"),
    new Horse(5, "b"),
    new Elephent(6, "b"),
    new Rock(7, "b"),
    new Solider(8, "b"),
    new Solider(9, "b"),
    new Solider(10, "b"),
    new Solider(11, "b"),
    new Solider(12, "b"),
    new Solider(13, "b"),
    new Solider(14, "b"),
    new Solider(15, "b"),
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    new Solider(40, "w"),
    new Solider(41, "w"),
    new Solider(42, "w"),
    new Solider(43, "w"),
    new Solider(44, "w"),
    new Solider(45, "w"),
    new Solider(46, "w"),
    new Solider(47, "w"),
    new Rock(48, "w"),
    new Elephent(49, "w"),
    new Horse(50, "w"),
    new Qeen(51, "w"),
    new King(52, "w"),
    new Horse(53, "w"),
    new Elephent(55, "w"),
    new Rock(56, "w"),
  ];

  var _whiteDeadList = [];

  var _blacDeadList = [];

  fillBoard() {}
  Color color = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 8,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(_defaultList.length, (index) {
            color = (color == Colors.blueGrey) ? Colors.white : Colors.blueGrey;
            if (index % 8 == 0) {
              color =
                  (color == Colors.blueGrey) ? Colors.white : Colors.blueGrey;
            }
            return Center(
              child: PlaceWdget(_defaultList[index], color),
            );
          }),
        ),
      ),
    );
  }
}
