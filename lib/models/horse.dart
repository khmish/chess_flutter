import 'chees_item.dart' ;

class Horse implements ChessItem{
  Horse(  this.place,this.team);
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