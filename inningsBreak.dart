import 'package:flutter/material.dart';

class InningsBreak extends StatelessWidget {
  final int initScore;
  final Function setBowl;
  final Function reset;

  InningsBreak(this.initScore,this.setBowl,this.reset);
  @override
  Widget build(BuildContext context) {
    return Column(
                      children: [
                        Text(
                          'You are Out!',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(''),
                        Text(
                          'Your final Score is: ' + initScore.toString(),
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(''),
                        RaisedButton(
                            child: Text('Begin Bowling'), onPressed: setBowl),
                        RaisedButton(
                            child: Text('Start Again'), onPressed: reset),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                    );
  }
}