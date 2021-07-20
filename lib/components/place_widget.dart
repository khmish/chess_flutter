import 'dart:js_util';

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
  const PlaceWdget(this.item, this.colorItem);

  @override
  _PlaceWdgetState createState() => _PlaceWdgetState();
}

class _PlaceWdgetState extends State<PlaceWdget> {
  @override
  Widget build(BuildContext context) {
    var icn;
    if ((widget.item is Solider)) {
      icn = Icon(Icons.local_police_outlined,size: 50,);
    } else if ((widget.item is King)) {
      icn = Icon(Icons.elderly_outlined,size: 50,);
    } else if ((widget.item is Qeen)) {
      icn = Icon(Icons.pregnant_woman,size: 50,);
    } else if ((widget.item is Elephent)) {
      icn = Icon(Icons.car_repair,size: 50,);
    } else if ((widget.item is Horse)) {
      icn = Icon(Icons.motorcycle_outlined,size: 50,);
    } else if ((widget.item is Rock)) {
      icn = Icon(Icons.house_outlined,size: 50,);
    } else {
      icn = Text("");
    }

    return Container(
      color: widget.colorItem,
      child: Center(
        child: icn,
      ),
    );
  }
}
