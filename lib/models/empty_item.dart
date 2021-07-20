import 'package:chess_flutter/models/chees_item.dart';

class EmptyItem implements ChessItem{


  
  EmptyItem( this.place,this.team);
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
  var name="Empty";

}