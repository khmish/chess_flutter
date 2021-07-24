import 'package:chess_flutter/components/place_widget.dart';
import 'package:chess_flutter/models/empty_item.dart';
import 'package:chess_flutter/models/rock.dart';
import 'package:flutter/material.dart';

import 'models/chees_item.dart';
import 'models/elephent.dart';
import 'models/horse.dart';
import 'models/king.dart';
import 'models/qeen.dart';
import 'models/solider.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _defaultList = [
    new Rock(0, "b", false, false),
    new Elephent(1, "b"),
    new Horse(2, "b"),
    new Queen(3, "b"),
    new King(4, "b"),
    new Horse(5, "b"),
    new Elephent(6, "b"),
    new Rock(7, "b"),
    new Solider(8, "b"),
    new Solider(9, "b"),
    new Solider(10, "b"),
    new Solider(11, "b"),
    new Solider(12, "b"),
    new Solider(13, "b"),
    new Solider(14, "b"),
    new Solider(15, "b"),
    new EmptyItem(16, ""),
    new EmptyItem(17, ""),
    new EmptyItem(18, ""),
    new EmptyItem(19, ""),
    new EmptyItem(20, ""),
    new EmptyItem(21, ""),
    new EmptyItem(22, ""),
    new EmptyItem(23, ""),
    new EmptyItem(24, ""),
    new EmptyItem(25, ""),
    new EmptyItem(26, ""),
    new EmptyItem(27, ""),
    new EmptyItem(28, ""),
    new EmptyItem(29, ""),
    new EmptyItem(30, ""),
    new EmptyItem(31, ""),
    new EmptyItem(32, ""),
    new EmptyItem(33, ""),
    new EmptyItem(34, ""),
    new EmptyItem(35, ""),
    new EmptyItem(36, ""),
    new EmptyItem(37, ""),
    new EmptyItem(38, ""),
    new EmptyItem(39, ""),
    new EmptyItem(40, ""),
    new EmptyItem(41, ""),
    new EmptyItem(42, ""),
    new EmptyItem(43, ""),
    new EmptyItem(44, ""),
    new EmptyItem(45, ""),
    new EmptyItem(46, ""),
    new EmptyItem(47, ""),
    new Solider(48, "w"),
    new Solider(49, "w"),
    new Solider(50, "w"),
    new Solider(51, "w"),
    new Solider(52, "w"),
    new Solider(53, "w"),
    new Solider(54, "w"),
    new Solider(55, "w"),
    new Rock(56, "w"),
    new Elephent(57, "w"),
    new Horse(58, "w"),
    new Queen(59, "w"),
    new King(60, "w"),
    new Horse(61, "w"),
    new Elephent(62, "w"),
    new Rock(63, "w"),
  ];
  var turnTeam = "w";

  var _whiteDeadList = [];

  var _blacDeadList = [];

  var selectedItem;

  Color color = Colors.blueGrey;

  bool isMoved = false;

  clear() {
    this.selectedItem = null;
    for (var item in this._defaultList) {
      item.possibleKill = false;
      item.possibleMove = false;
    }
  }

  moves() {
    if (this.selectedItem.team == turnTeam) {
      //check the turns for each team
      if ((this.selectedItem is Solider)) {
        soilderMoves();
      } else if ((this.selectedItem is King)) {
        kingMoves();
      } else if ((this.selectedItem is Queen)) {
        queenMoves();
      } else if ((this.selectedItem is Elephent)) {
        elephentMoves();
      } else if ((this.selectedItem is Horse)) {
        horseMoves();
      } else if ((this.selectedItem is Rock)) {
        rockMoves();
      } else {}
      
    } else {
      Fluttertoast.showToast(
          msg: "it is the ${turnTeam == 'w' ? 'white team' : 'black team'}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 25.0);
    }
    if (isMoved) {
        turnTeam = turnTeam == "w" ? "b" : "w";
      }
  }

  soilderMoves() {
    Solider solider = this.selectedItem;
    ChessItem tmp;
    if (solider.team == "w") {
      int sameRow1 = ((solider.place - 7) ~/ 8);
      int sameRow2 = ((solider.place - 8) ~/ 8);
      int sameRow3 = ((solider.place - 9) ~/ 8);
      if (solider.place - 8 >= 0) {
        //forward move
        tmp = _defaultList[solider.place - 8];
        if (tmp is EmptyItem) {
          tmp.possibleMove = true;
        }
      }
      if (solider.place - 7 >= 0 && sameRow1 == sameRow2) {
        //
        tmp = _defaultList[solider.place - 7];
        if (!(tmp is EmptyItem)) {
          if (tmp.team != solider.team) {
            tmp.possibleKill = true;
          }
        }
        // moves.add(tmp);
      }
      if (solider.place - 9 >= 0 && sameRow3 == sameRow2) {
        tmp = _defaultList[solider.place - 9];
        if (!(tmp is EmptyItem)) {
          if (tmp.team != solider.team) {
            tmp.possibleKill = true;
          }
        }
        // moves.add(tmp);
      }
    } else {
      int sameRow1 = ((solider.place + 7) ~/ 8);
      int sameRow2 = ((solider.place + 8) ~/ 8);
      int sameRow3 = ((solider.place + 9) ~/ 8);
      if (solider.place + 8 <= _defaultList.length) {
        //forward move
        tmp = _defaultList[solider.place + 8];
        if (tmp is EmptyItem) {
          tmp.possibleMove = true;
        }
      }

      if (solider.place + 7 <= _defaultList.length && (sameRow1 == sameRow2)) {
        //kill dia
        tmp = _defaultList[solider.place + 7];
        if (!(tmp is EmptyItem)) {
          if (tmp.team != solider.team) {
            tmp.possibleKill = true;
          }
        }
        // moves.add(tmp);
      }

      if (solider.place + 9 <= _defaultList.length && (sameRow2 == sameRow3)) {
        //kill dia
        tmp = _defaultList[solider.place + 9];
        if (!(tmp is EmptyItem)) {
          if (tmp.team != solider.team) {
            tmp.possibleKill = true;
          }
        }
        // moves.add(tmp);
      }
    }
  }

  horseMoves() {
    var movesList = [];
    Horse horse = this.selectedItem;
    movesList.add(horse.place + 16 + 1);
    movesList.add(horse.place + 16 - 1);
    movesList.add(horse.place + 8 + 2);
    movesList.add(horse.place + 8 - 2);
    movesList.add(horse.place - 8 + 2);
    movesList.add(horse.place - 8 - 2);
    movesList.add(horse.place - 16 + 1);
    movesList.add(horse.place - 16 - 1);
    for (var item in movesList) {
      if (item >= 0 && item < _defaultList.length) {
        int same1 = horse.place ~/ 8;
        int same2 = item ~/ 8;
        if (same1 != same2) {
          if (_defaultList[item] is EmptyItem) {
            setState(() {
              _defaultList[item].possibleMove = true;
            });
          } else {
            setState(() {
              if (horse.team != _defaultList[item].team)
                _defaultList[item].possibleKill = true;
            });
          }
        }
      }
    }
  }

  rockMoves() {
    ChessItem rock = this.selectedItem;
    // int same1 = rock.place ~/ 8;
    // int same2 = selectedItem.place ~/ 8;
    for (var i = 1; i <= 8; i++) {
      int same1 = (rock.place) ~/ 8;
      int same2 = (rock.place + i) ~/ 8;
      if ((rock.place + i) < _defaultList.length) {
        if (same1 == same2) {
          setState(() {
            if (_defaultList[rock.place + i] is EmptyItem) {
              _defaultList[rock.place + i].possibleMove = true;
            } else if (_defaultList[rock.place + i].team != rock.team) {
              _defaultList[rock.place + i].possibleKill = true;
              i = 9;
            } else {
              i = 9;
            }
          });
        }
      }
    }
    for (var i = 1; i <= 8; i++) {
      int same1 = rock.place ~/ 8;
      int same2 = (rock.place - i) ~/ 8;
      if ((rock.place - i) >= 0) {
        if (same1 == same2) {
          setState(() {
            if (_defaultList[rock.place - i] is EmptyItem) {
              _defaultList[rock.place - i].possibleMove = true;
            } else if (_defaultList[rock.place - i].team != rock.team) {
              _defaultList[rock.place - i].possibleKill = true;
              i = 9;
            } else {
              i = 9;
            }
          });
        }
      }
    }

    for (var i = 1; i <= 8; i++) {
      int val = rock.place + (i * 8);
      if ((val) < _defaultList.length) {
        setState(() {
          if (_defaultList[val] is EmptyItem) {
            _defaultList[val].possibleMove = true;
          } else if (_defaultList[val].team != rock.team) {
            _defaultList[val].possibleKill = true;
            i = 9;
          } else {
            i = 9;
          }
        });
      }
    }
    for (var i = 1; i <= 8; i++) {
      int val = rock.place - (i * 8);
      if ((val) >= 0) {
        setState(() {
          if (_defaultList[val] is EmptyItem) {
            _defaultList[val].possibleMove = true;
          } else if (_defaultList[val].team != rock.team) {
            _defaultList[val].possibleKill = true;
            i = 9;
          } else {
            i = 9;
          }
        });
      }
    }
  }

  elephentMoves() {
    ChessItem elephent = this.selectedItem;
    int row = elephent.place ~/ 8;
    int col = elephent.place % 8;
    print("row = $row , col = $col");
    for (var i = 1; i <= 8; i++) {
      int x = row + i;
      int y = col + i;
      if (x >= 7 || y >= 7) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != elephent.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        } else if (_defaultList[sum].team == elephent.team) {
          // _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }
    for (var i = 1; i <= 8; i++) {
      int x = row + i;
      int y = col - i;
      if (x > 7 || y < 0) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != elephent.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        } else if (_defaultList[sum].team == elephent.team) {
          // _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }

    for (var i = 1; i <= 8; i++) {
      int x = row - i;
      int y = col - i;
      if (x < 0 || y < 0) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != elephent.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        } else if (_defaultList[sum].team == elephent.team) {
          // _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }
    for (var i = 1; i <= 8; i++) {
      int x = row - i;
      int y = col + i;
      if (x < 0 || y > 7) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != elephent.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        } else if (_defaultList[sum].team == elephent.team) {
          // _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }
  }

  queenMoves() {
    elephentMoves();
    rockMoves();
  }

  kingMoves() {
    kingXMoves();
    kingYMoves();
    kingDiaLMoves();
  }

  kingXMoves() {
    ChessItem king = this.selectedItem;
    var moveList = [];
    moveList.add(king.place + 1);
    moveList.add(king.place - 1);
    int row = king.place ~/ 8;
    for (var move in moveList) {
      int rowMove = move ~/ 8;
      if (move >= 0 && move < _defaultList.length) {
        if (row == rowMove) {
          setState(() {
            if (_defaultList[move] is EmptyItem)
              _defaultList[move].possibleMove = true;
            else if (_defaultList[move].team != king.team) {
              _defaultList[move].possibleKill = true;
            }
          });
        }
      }
    }
  }

  kingYMoves() {
    ChessItem king = this.selectedItem;
    var moveList = [];
    moveList.add(king.place + 8);
    moveList.add(king.place - 8);
    // int row = king.place ~/ 8;
    int col = king.place % 8;
    for (var move in moveList) {
      int colMove = move % 8;
      if (move >= 0 && move < _defaultList.length) {
        if (col == colMove) {
          setState(() {
            if (_defaultList[move] is EmptyItem)
              _defaultList[move].possibleMove = true;
            else if (_defaultList[move].team != king.team) {
              _defaultList[move].possibleKill = true;
            }
          });
        }
      }
    }
  }

  kingDiaLMoves() {
    ChessItem king = this.selectedItem;
    int row = king.place ~/ 8;
    int col = king.place % 8;
    print("row = $row , col = $col");
    for (var i = 1; i <= 1; i++) {
      int x = row + i;
      int y = col + i;
      if (x >= 7 || y >= 7) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != king.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }
    for (var i = 1; i <= 1; i++) {
      int x = row + i;
      int y = col - i;
      if (x > 7 || y < 0) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != king.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }

    for (var i = 1; i <= 1; i++) {
      int x = row - i;
      int y = col - i;
      if (x < 0 || y < 0) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != king.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }
    for (var i = 1; i <= 1; i++) {
      int x = row - i;
      int y = col + i;
      if (x < 0 || y > 7) {
        i = 10;
      } else {
        int sum = ((x * 8) + (y));
        print("sum = $sum");
        if (_defaultList[sum] is EmptyItem)
          _defaultList[sum].possibleMove = true;
        else if (_defaultList[sum].team != king.team) {
          _defaultList[sum].possibleKill = true;
          i = 10;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.9;
    var width = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                for (var i in _whiteDeadList) PlaceWdget(i, Colors.blueGrey)
              ],
            ),
            Container(
              height: height,
              width: width,
              child: GridView.count(
                shrinkWrap: true,
                //draw the board and coloring it
                crossAxisCount: 8,
                children: List.generate(
                  _defaultList.length,
                  (index) {
                    color = ((color == Colors.blueGrey)
                        ? Colors.blueGrey[200]
                        : Colors.blueGrey)!;
                    if (index % 8 == 0) {
                      color = ((color == Colors.blueGrey)
                          ? Colors.blueGrey[200]
                          : Colors.blueGrey)!;
                    }
                    return Center(
                      child: GestureDetector(
                        child: PlaceWdget(_defaultList[index], color),
                        onTap: () {
                          ChessItem itm = _defaultList[index];

                          setState(() {
                            if (itm.possibleKill && this.selectedItem != null) {
                              //kill move
                              int currentPlace = itm.place;
                              if (itm.team == "w") {
                                //add to white kill list
                                _whiteDeadList.add(itm);

                                _defaultList[currentPlace] = this.selectedItem;
                                _defaultList[this.selectedItem.place] =
                                    new EmptyItem(this.selectedItem.place, "");
                                this.selectedItem.place = currentPlace;
                              } else {
                                //add to black kill list
                                _blacDeadList.add(itm);

                                _defaultList[currentPlace] = this.selectedItem;
                                _defaultList[this.selectedItem.place] =
                                    new EmptyItem(this.selectedItem.place, "");

                                this.selectedItem.place = currentPlace;
                              }
                              clear();
                              isMoved = true;
                            }
                            if (itm.possibleMove && this.selectedItem != null) {
                              //possible move
                              int currentPlace = itm.place;

                              _defaultList[currentPlace] = this.selectedItem;
                              _defaultList[this.selectedItem.place] =
                                  new EmptyItem(this.selectedItem.place, "");

                              this.selectedItem.place = currentPlace;

                              clear();
                              isMoved = true;
                            }
                            if (itm.possibleMove == false &&
                                itm.possibleKill == false &&
                                this.selectedItem != null) {
                              //unselect move
                              clear();
                              isMoved = false;
                            }
                            this.selectedItem = itm.possibleKill ? null : itm;

                            // clear();
                            moves(); //move
                          });
                          // print("is%8 :${isB} , index :${index}");

                          print("${itm.name} ${itm.team} ${itm.place} , isMoved= $isMoved");
                        },
                      ), // cell
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                for (var i in _blacDeadList) PlaceWdget(i, Colors.white)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
