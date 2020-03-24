import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int oppScore;
  final int initScore;
  final int actualBowl;
  final int initOppScore;
  final Function reset;

  ResultPage(this.initScore,this.initOppScore,this.oppScore,this.actualBowl,this.reset);
  @override
  Widget build(BuildContext context) {
    return Column(
                          children: [
                            oppScore <= initScore ||
                                    actualBowl == (oppScore - initOppScore)
                                ? Text(
                                    'You have got the Batsman Out!',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    'The Opponent Got the Better of you.',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                            Text(''),
                            Text(
                              'You Scored: ' + initScore.toString(),
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            oppScore <= initScore ||
                                    actualBowl == (oppScore - initOppScore)
                                ? Text(
                                    'Your Opponent Scored: ' +
                                        initOppScore.toString(),
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    'Your Opponent Scored: ' +
                                        oppScore.toString(),
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                            RaisedButton(
                                child: Text('Play Again'), onPressed: reset),
                            initOppScore == initScore &&
                                    actualBowl == (oppScore - initOppScore)
                                ? Text(
                                    '\nIt\'s a Tie.',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  )
                                : oppScore < initScore ||
                                        actualBowl == (oppScore - initOppScore)
                                    ? Text(
                                        '\nYou Won!',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        '\nYou Lost.',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        );
  }
}