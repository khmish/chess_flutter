import 'package:chess_flutter/models/chees_item.dart';

class King implements ChessItem {

  King( this.place,this.team);
  @override
  allowedMoves() {
    // TODO: implement allowedMoves
    throw UnimplementedError();
  }


  @override
  var team;

  @override
  int place;
}
