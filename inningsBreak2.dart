import 'package:flutter/material.dart';

class InningsBreak2 extends StatelessWidget {
  final int initOppScore;
  final Function setBowl;
  final Function reset;

  InningsBreak2(this.initOppScore, this.setBowl, this.reset);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'You Have Got the Opponent Out!',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(''),
        Text(
          'Opponent\'s final Score is: ' + initOppScore.toString(),
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(''),
        RaisedButton(child: Text('Begin 2nd Innings'), onPressed: setBowl),
        RaisedButton(child: Text('Start Again'), onPressed: reset),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
