import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tictactoe/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();

  static _GameScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_GameScreenState>()!;
}

class _GameScreenState extends State<GameScreen> {
  final Map<String, int> _score = {'X': 0, 'O': 0};

  void updateScore(String player) => setState(() {
        if (player != 'Draw') {
          _score.update(player, (value) => value + 1);
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Icon(
        //     Icons.settings,
        //   ),
        // ],
        title: Text(
          'Tic Tac Toe',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              'Score',
              style: TextStyle(fontSize: 50.0),
            ),
          ),
          Text(
            'X : O',
            style: TextStyle(fontSize: 40.0),
          ),
          Text(
            "${_score['X']} : ${_score['O']}",
            style: TextStyle(fontSize: 40.0),
          ),
          GameBoard(),
          
        ],
      ),
    );
  }
}
