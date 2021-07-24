import 'chees_item.dart' ;

class Horse implements ChessItem{
  Horse( this.place,this.team,[this.possibleMove=false,this.possibleKill=false]);
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
  var name="Horse";

  @override
  bool possibleKill=false;

  @override
  bool possibleMove=false;

}