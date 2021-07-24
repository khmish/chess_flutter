import 'package:chess_flutter/models/chees_item.dart';

class Elephent implements ChessItem{
  Elephent( this.place,this.team,[this.possibleMove=false,this.possibleKill=false]);

  

  @override
  var team;

  @override
  int place;

  @override
  var name="Elephent";

  @override
  bool possibleKill=false;

  @override
  bool possibleMove=false;

}