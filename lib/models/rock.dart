import 'package:chess_flutter/models/chees_item.dart';

class Rock implements ChessItem{

  Rock( this.place,this.team,[this.possibleMove=false,this.possibleKill=false]);



  @override
  var team;

  @override
  int place;

  @override
  var name="Rock";

  @override
  bool possibleKill=false;

  @override
  bool possibleMove=false;

}