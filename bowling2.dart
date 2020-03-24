import 'package:flutter/material.dart';
import './button1.dart';

class Bowling2 extends StatelessWidget {
  final int oppScore;
  final int initOppScore;
  final int oppnBat;
  final int actualBowl;
  final int initScore;
  final Function addOppnScore;
  final Function reset;

  Bowling2(this.initScore,this.oppScore,this.initOppScore,this.actualBowl,this.oppnBat,this.addOppnScore,this.reset);
  @override
  Widget build(BuildContext context) {
    return Column(
                          children: [
                            Text(
                              'You Are BOWLING',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Text(''),
                            Text(
                              'Opponent\'s Score: ' + oppScore.toString(),
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(''),
                            Text(''),
                            Text(
                              'Opponent Chose: ' +
                                  (oppScore - initOppScore).toString(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Button1(addOppnScore, 1, oppnBat),
                                Button1(addOppnScore, 2, oppnBat),
                                Button1(addOppnScore, 3, oppnBat),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            Row(
                              children: [
                                Button1(addOppnScore, 4, oppnBat),
                                Button1(addOppnScore, 5, oppnBat),
                                Button1(addOppnScore, 6, oppnBat),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            Text(
                              'You Chose: ' + actualBowl.toString(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text(''),
                            RaisedButton(
                                child: Text('Start Again'), onPressed: reset),
                          ],
                        );
  }
}