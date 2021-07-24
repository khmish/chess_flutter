import 'dart:js_util';

import 'package:chess_flutter/models/chees_item.dart';
import 'package:chess_flutter/models/elephent.dart';
import 'package:chess_flutter/models/horse.dart';
import 'package:chess_flutter/models/king.dart';
import 'package:chess_flutter/models/rock.dart';
import 'package:chess_flutter/models/solider.dart';
import 'package:chess_flutter/models/qeen.dart';
import 'package:flutter/material.dart';

class PlaceWdget extends StatefulWidget {
  final item;

  final Color colorItem;
  PlaceWdget(this.item, this.colorItem);

  @override
  _PlaceWdgetState createState() => _PlaceWdgetState();
}

class _PlaceWdgetState extends State<PlaceWdget> {
  @override
  Widget build(BuildContext context) {
    var name1 = widget.item as ChessItem;

    var icn;
    if ((widget.item is Solider)) {
      icn = Icon(
        Icons.local_police_outlined,
        size: 35,
        color: name1.team == "b" ? Colors.black87 : Colors.white70,
      );
    } else if ((widget.item is King)) {
      icn = Icon(
        Icons.elderly_outlined,
        size: 35,
        color: name1.team == "b" ? Colors.black87 : Colors.white70,
      );
    } else if ((widget.item is Queen)) {
      icn = Icon(
        Icons.pregnant_woman,
        size: 35,
        color: name1.team == "b" ? Colors.black87 : Colors.white70,
      );
    } else if ((widget.item is Elephent)) {
      icn = Icon(
        Icons.car_repair,
        size: 35,
        color: name1.team == "b" ? Colors.black87 : Colors.white70,
      );
    } else if ((widget.item is Horse)) {
      icn = Icon(
        Icons.motorcycle_outlined,
        size: 35,
        color: name1.team == "b" ? Colors.black87 : Colors.white70,
      );
    } else if ((widget.item is Rock)) {
      icn = Icon(
        Icons.house_outlined,
        size: 35,
        color: name1.team == "b" ? Colors.black87 : Colors.white70,
      );
    } else {
      icn = Text("");
    }

    return Container(
      color: widget.colorItem,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.yellow[200],
          border: name1.possibleKill || name1.possibleMove?Border.all(
            color: name1.possibleKill ?Colors.red:name1.possibleMove?Colors.green:Colors.white,
            width: 5,
          ):Border.all(),
        ),
        child: Center(
          child: icn,
        ),
      ),
    );
  }
}
