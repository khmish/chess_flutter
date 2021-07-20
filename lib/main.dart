import 'package:chess_flutter/components/place_widget.dart';
import 'package:chess_flutter/models/empty_item.dart';
import 'package:chess_flutter/models/rock.dart';
import 'package:flutter/material.dart';

import 'models/chees_item.dart';
import 'models/elephent.dart';
import 'models/horse.dart';
import 'models/king.dart';
import 'models/qeen.dart';
import 'models/solider.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
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
    new Queen(3, "b"),
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
    new EmptyItem(16, ""),
    new EmptyItem(17, ""),
    new EmptyItem(18, ""),
    new EmptyItem(19, ""),
    new EmptyItem(20, ""),
    new EmptyItem(21, ""),
    new EmptyItem(22, ""),
    new EmptyItem(23, ""),
    new EmptyItem(24, ""),
    new EmptyItem(25, ""),
    new EmptyItem(26, ""),
    new EmptyItem(27, ""),
    new EmptyItem(28, ""),
    new EmptyItem(29, ""),
    new EmptyItem(30, ""),
    new EmptyItem(31, ""),
    new EmptyItem(32, ""),
    new EmptyItem(33, ""),
    new EmptyItem(34, ""),
    new EmptyItem(35, ""),
    new EmptyItem(36, ""),
    new EmptyItem(37, ""),
    new EmptyItem(38, ""),
    new EmptyItem(39, ""),
    new EmptyItem(40, ""),
    new EmptyItem(41, ""),
    new EmptyItem(42, ""),
    new EmptyItem(43, ""),
    new EmptyItem(44, ""),
    new EmptyItem(45, ""),
    new EmptyItem(46, ""),
    new EmptyItem(47, ""),
    new Solider(48, "w"),
    new Solider(49, "w"),
    new Solider(50, "w"),
    new Solider(51, "w"),
    new Solider(52, "w"),
    new Solider(53, "w"),
    new Solider(54, "w"),
    new Solider(55, "w"),
    new Rock(56, "w"),
    new Elephent(57, "w"),
    new Horse(58, "w"),
    new Queen(59, "w"),
    new King(60, "w"),
    new Horse(61, "w"),
    new Elephent(62, "w"),
    new Rock(63, "w"),
  ];

  var _whiteDeadList = [];

  var _blacDeadList = [];

  var selectedItem;

  Color color = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.9;
    var width = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      body: Center(
        child: FittedBox(
          child: Container(
            height: height,
            width: width,
            child: GridView.count(
              shrinkWrap: true,
              //draw the board and coloring it
              crossAxisCount: 8,
              children: List.generate(
                _defaultList.length,
                (index) {
                  color = ((color == Colors.blueGrey)
                      ? Colors.blueGrey[200]
                      : Colors.blueGrey)!;
                  if (index % 8 == 0) {
                    color = ((color == Colors.blueGrey)
                        ? Colors.blueGrey[200]
                        : Colors.blueGrey)!;
                  }
                  return Center(
                    child: GestureDetector(
                      child: PlaceWdget(_defaultList[index], color),
                      onTap: () {
                        ChessItem itm = _defaultList[index];
                        print("${itm.name} ${itm.team} ${itm.place}");
                      },
                    ), // cell
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
