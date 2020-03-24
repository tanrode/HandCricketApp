import 'package:flutter/material.dart';
import './batting.dart';
import './inningsBreak.dart';
import './bowling.dart';
import './resultPage.dart';

class BattingFirst extends StatelessWidget {
  final int score;
  final int initScore;
  final int bowler;
  final Function addScore;
  final Function reset;
  final Function setBowl;
  final Function addOppnScore;
  final int oppScore;
  final int initOppScore;
  final int actualBowl;
  final int oppnBat;
  final int bowl;
  
  BattingFirst(this.actualBowl,this.addOppnScore,this.reset,this.initOppScore,this.initScore,this.bowler,this.addScore,this.score,this.setBowl,this.oppnBat,this.oppScore,this.bowl);
  @override
  Widget build(BuildContext context) {
    return Container(child: 
      bowler != (score - initScore)
            ? Batting(initScore, score, bowler,
                addScore, reset)
            : bowl == 0
                ? InningsBreak(
                    initScore, setBowl, reset)
                : actualBowl !=
                            (oppScore -
                                initOppScore) &&
                        oppScore <= initScore
                    ? Bowling(
                        initScore,
                        oppScore,
                        initOppScore,
                        actualBowl,
                        oppnBat,
                        addOppnScore,
                        reset)
                    : ResultPage(
                        initScore,
                        initOppScore,
                        oppScore,
                        actualBowl,
                        reset),
);
}
}