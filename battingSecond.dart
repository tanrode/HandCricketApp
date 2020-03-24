import 'package:flutter/material.dart';
import './batting2.dart';
import './inningsBreak.dart';
import './inningsBreak2.dart';
import './bowling2.dart';
import './resultPage.dart';
import './resultPage2.dart';

class BattingSecond extends StatelessWidget {
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

  BattingSecond(
      this.actualBowl,
      this.addOppnScore,
      this.reset,
      this.initOppScore,
      this.initScore,
      this.bowler,
      this.addScore,
      this.score,
      this.setBowl,
      this.oppnBat,
      this.oppScore,
      this.bowl);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: actualBowl != (oppScore - initOppScore) 
          ? Bowling2(initScore, oppScore, initOppScore, actualBowl, oppnBat,
              addOppnScore, reset)
          : bowl == 0
              ? InningsBreak2(initOppScore, setBowl, reset)
              : bowler != (score - initScore) && score <= initOppScore
                  ? Batting2(initScore, score, bowler, addScore, reset,initOppScore)
                  : ResultPage2(
                      initScore, initOppScore, oppScore, actualBowl, reset,score),
    );
  }
}
