import 'package:flutter/material.dart';
import './button.dart';

class Batting2 extends StatelessWidget {
  final int score;
  final int initScore;
  final int bowler;
  final Function addScore;
  final Function reset;
  final int initOppScore;

  Batting2(this.initScore,this.score,this.bowler,this.addScore,this.reset,this.initOppScore);
  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Text(
                      'You Are BATTING',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(''),
                    Text(
                      'Your Score: ' + score.toString(),
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(''),
                    Text(''),
                    Text(
                      'You Chose: ' + (score - initScore).toString(),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Button(addScore, 1, bowler),
                        Button(addScore, 2, bowler),
                        Button(addScore, 3, bowler),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Row(
                      children: [
                        Button(addScore, 4, bowler),
                        Button(addScore, 5, bowler),
                        Button(addScore, 6, bowler),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Text(''),
                    Text(
                      'Bowler Chose: ' + bowler.toString(),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    RaisedButton(child: Text('Start Again'), onPressed: reset),
                    Text(''),
                    Text('Target: '+(initOppScore+1).toString(),style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
                  ],
                );
  }
}