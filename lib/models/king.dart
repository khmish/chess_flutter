import 'package:chess_flutter/models/chees_item.dart';

class King implements ChessItem {

  King( this.place,this.team,[this.possibleMove=false,this.possibleKill=false]);
  @override
  allowedMoves() {
    // TODO: implement allowedMoves
    throw UnimplementedError();
  }


  @override
  var team;

  @override
  int place;

  @override
  var name="King";

  @override
  bool possibleKill=false;

  @override
  bool possibleMove=false;
}
