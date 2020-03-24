import 'package:flutter/material.dart';
import 'package:hand_cricket/inningsBreak.dart';
import 'package:hand_cricket/resultPage.dart';
import './button.dart';
import './button1.dart';
import './mainPage.dart';
import 'inningsBreak.dart';
import './batting.dart';
import './bowling.dart';
import './resultPage.dart';
import 'dart:math' show Random;

void main() {
  runApp(HandCricket());
}

class HandCricket extends StatefulWidget {
  @override
  _HandCricketState createState() => _HandCricketState();
}

class _HandCricketState extends State<HandCricket> {
  var score = 0;
  var initScore = 0;
  int bowler = -1;
  var oppnBat = 0;
  var randomizer, randomizer1;
  int bowl = 0, bat = 0;
  var oppScore = 0, initOppScore = 0;
  var initBowl = -1, actualBowl = -1;
  var start=0;

  void addScore(int runs) {
    setState(() {
      initScore = score;
      score += runs;

      randomizer = new Random(); // can get a seed as a parameter
      bowler = randomizer.nextInt(6) +
          1; // Integer between 0 and 6 (0 inclusiev 6 not)
    });
  }

  void addOppnScore(int runs, int bowl) {
    setState(() {
      randomizer1 = new Random(); // can get a seed as a parameter
      oppnBat = randomizer1.nextInt(6) + 1; // Integer between 0 and 6 (0 inclusiev 6 not)
      initBowl = actualBowl;
      actualBowl = bowl;
      initOppScore = oppScore;
      oppScore+=runs;
      //oppScore += 3;
    });
  }

  void reset() {
    setState(() {
      initScore = 0;
      score = 0;
      bowl = 0;
      bat = 0;
      oppScore = 0;
      initOppScore = 0;
      oppnBat = 0;
      initBowl = -1;
      actualBowl = -1;
      start=0;
    });
  }

  void setBowl() {
    setState(() {
      bowl = 1;
      randomizer1 = new Random(); // can get a seed as a parameter
      oppnBat = randomizer1.nextInt(6) + 1; // Integer between 0 and 6 (0 inclusiev 6 not)
    });
  }

  void setStart()
  {
    setState(() {
      start=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(102, 204, 0, 0.8),
          title: Text(
            'Hand Cricket 2020',
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(5),
          child:
              start==0 ? MainPage(setStart):
               bowler != (score - initScore)
              ? Batting(initScore,score,bowler,addScore,reset)
              : bowl == 0
                  ? InningsBreak(initScore,setBowl,reset)
                  : actualBowl != (oppScore - initOppScore) &&
                          oppScore <= initScore
                      ? Bowling(initScore, oppScore, initOppScore, actualBowl, oppnBat, addOppnScore, reset)
                      : ResultPage(initScore, initOppScore, oppScore, actualBowl, reset),
        ),
      ),
    );
  }
}
