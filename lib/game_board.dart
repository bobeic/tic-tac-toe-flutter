import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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

  bool updateBoard(int index) {
    if (currentBoard[index] == '') {
      setState(() => currentBoard[index] = xToPlay ? 'X' : 'O');
      return true;
    } else {
      return false;
    }
  }

  bool checkWinner(int index, String player) {
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
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
              child: Text(currentBoard[index]),
            ),
          ),
          onTap: () {
            if (updateBoard(index)) {
              String player = xToPlay ? 'X' : 'O';
              if (checkWinner(index, player)) {
                // print('$player Won!');
              } else {
                xToPlay = !xToPlay;
                // print(currentBoard);
              }
            }
          },
        ),
      ),
    );
  }
}
