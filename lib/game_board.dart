import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tictactoe/game_screen.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool xToPlay = true;
  List currentBoard = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  final List winning_combinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  bool _enabled = true;

  void createNewBoard() {
    setState(() {
      xToPlay = true;
      _enabled = true;
      currentBoard = [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ];
    });
  }

  bool updateBoard(int index) {
    if (currentBoard[index] == '') {
      setState(() => currentBoard[index] = xToPlay ? 'X' : 'O');
      return true;
    } else {
      return false;
    }
  }

  String gameOver(int index, String player) {
    for (final comb in winning_combinations) {
      if (comb.contains(index)) {
        bool playerHasWon = true;
        for (final tile in comb) {
          if (currentBoard[tile] != player) {
            playerHasWon = false;
            break;
          }
        }
        if (playerHasWon) {
          return player;
        }
      }
    }
    if (currentBoard.contains('')) {
      return '';
    } else {
      return 'Draw';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              9,
              (index) => GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      currentBoard[index],
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (_enabled) {
                    if (updateBoard(index)) {
                      String player = xToPlay ? 'X' : 'O';
                      String gameOverType = gameOver(index, player);
                      if (gameOverType != '') {
                        _enabled = false;
                        GameScreen.of(context).updateScore(gameOverType);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              gameOverType == 'Draw'
                                  ? 'It was a draw!'
                                  : '$player Won!',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        xToPlay = !xToPlay;
                      }
                    }
                  } else {
                    null;
                  }
                },
              ),
            ),
          ),
        ),
        CupertinoButton(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(80.0),
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          onPressed: () => createNewBoard(),
          child: Text(
            'Play Again',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
