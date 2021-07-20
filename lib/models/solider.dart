import 'package:chess_flutter/models/chees_item.dart';

class Solider implements ChessItem{


  
  Solider( this.place,this.team);
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