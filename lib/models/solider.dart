import 'package:chess_flutter/models/chees_item.dart';

class Solider implements ChessItem {
  Solider( this.place,this.team,[this.possibleMove=false,this.possibleKill=false]);

  


  @override
  var team;

  @override
  int place;

  @override
  var name = "Solider";

  @override
  bool possibleKill=false;

  @override
  bool possibleMove=false;
}
