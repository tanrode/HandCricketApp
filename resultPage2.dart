import 'package:flutter/material.dart';

class ResultPage2 extends StatelessWidget {
  final int oppScore;
  final int initScore;
  final int actualBowl;
  final int initOppScore;
  final int score;
  final Function reset;

  ResultPage2(this.initScore, this.initOppScore, this.oppScore, this.actualBowl,
      this.reset,this.score);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        score <= initOppScore || actualBowl == (score - initScore)
            ? Text(
                'Your Opponent has got you Out!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            : Text(
                'Let the Celebrations Begin.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
        Text(''),
        Text(
          'Your Opponent Scored: ' + initOppScore.toString(),
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        score <= initOppScore || actualBowl == (score - initScore)
            ? Text(
                'You Scored: ' + initScore.toString(),
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )
            : Text(
                'You Scored: ' + score.toString(),
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
        RaisedButton(child: Text('Play Again'), onPressed: reset),
        initOppScore == initScore && actualBowl == (score - initScore)
            ? Text(
                '\nIt\'s a Tie.',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )
            : score < initOppScore || actualBowl == (score - initScore)
                ? Text(
                    '\nYou Lost.',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )
                : Text(
                    '\nYou Won!',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
