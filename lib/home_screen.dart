import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Tic Tac Toe',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
            CupertinoButton(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(80.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GameScreen(),
                ),
              ),
              // pressedOpacity: 0.7,
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
