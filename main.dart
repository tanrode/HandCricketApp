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
import './toss.dart';
import './battingFirst.dart';
import './battingSecond.dart';
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
  var start = 0;
  var tossTime = 0;
  var tossResult = -1;
  var tossGen = -1;
  var decision = 0;
  var player = -1;
  var innings = -1;
  var startMatch=0;

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
      oppnBat = randomizer1.nextInt(6) +
          1; // Integer between 0 and 6 (0 inclusiev 6 not)
      initBowl = actualBowl;
      actualBowl = bowl;
      initOppScore = oppScore;
      oppScore += runs;
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
      start = 0;
      tossTime = 0;
      tossResult = -1;
      tossGen = -1;
      decision = 0;
      player = -1;
      innings = -1;
      startMatch=0;
    });
  }

  void setBowl() {
    setState(() {
      bowl = 1;
      randomizer1 = new Random(); // can get a seed as a parameter
      oppnBat = randomizer1.nextInt(6) +
          1; // Integer between 0 and 6 (0 inclusiev 6 not)
    });
  }

  void setStart() {
    setState(() {
      start = 1;
    });
  }

  void setToss(int x) {
    setState(() {
      tossResult = x;
      tossTime = 1;
      randomizer1 = new Random(); // can get a seed as a parameter
      tossGen = randomizer1.nextInt(2) +
          1; // Integer between 0 and 2 (0 inclusiev 2 not)
    });
  }

  void setDecision(int d, int f) {
    setState(() {
      decision = d;
      player = f;
      randomizer1 = new Random(); // can get a seed as a parameter
      oppnBat = randomizer1.nextInt(6) +
          1; // Integer between 0 and 6 (0 inclusiev 6 not)
    });
  }

  void setInnings(int x) {
    setState(() {
      innings = x;
      player=-1;
      startMatch=1;
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
          child: start == 0
              ? MainPage(setStart)
              : tossTime == 0
                  ? Toss(setToss)
                  : tossResult == tossGen && player == -1 && startMatch==0
                      ? Column(
                          children: <Widget>[
                            Text(
                              'You have Won the Toss.',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text('What do you want to do?'),
                            RaisedButton(
                                child: Text('Batting'),
                                onPressed: () => setDecision(1, 1)),
                            RaisedButton(
                                child: Text('Bowling'),
                                onPressed: () => setDecision(2, 1)),
                            RaisedButton(
                                child: Text('Start Again'), onPressed: reset),
                          ],
                        )
                      : tossResult != tossGen && player == -1 && startMatch==0
                          ? Column(
                              children: <Widget>[
                                Text(
                                  'You have Lost the Toss',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                RaisedButton(
                                    child: Text('Continue'),
                                    onPressed: () => setDecision(tossGen, 2)),
                                RaisedButton(
                                    child: Text('Play Again'),
                                    onPressed: reset),
                              ],
                            )
                          : player == 1
                              ? Column(
                                  children: <Widget>[
                                    decision == 1
                                        ? Column(
                                            children: [
                                              Text(
                                                'You Have elected to Bat first.',
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              RaisedButton(
                                                  child: Text('Start Match'),
                                                  onPressed: () =>
                                                      setInnings(1)),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Text(
                                                'You Have elected to Bowl first.',
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              RaisedButton(
                                                  child: Text('Start Match'),
                                                  onPressed: () =>
                                                      setInnings(2)),
                                            ],
                                          ),
                                    Text(''),
                                    RaisedButton(
                                        child: Text('Play Again'),
                                        onPressed: reset)
                                  ],
                                )
                              : player == 2
                                  ? Column(
                                      children: <Widget>[
                                        decision == 1
                                            ? Column(children: [Text(
                                            'The Opponent has elected to Bat first.',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          RaisedButton(child: Text('Start Match'),onPressed: () => setInnings(3)),
                                        ],
                                          )
                                            : Column(children: [Text(
                                            'The Opponent has elected to Bowl first.',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          RaisedButton(child: Text('Start Match'),onPressed: () => setInnings(4)),
                                        ],
                                          ),
                                        RaisedButton(
                                            child: Text('Play Again'),
                                            onPressed: reset)
                                      ],
                                    )
                                  : (innings==1 || innings==4)
                                      ? BattingFirst(actualBowl, addOppnScore, reset, initOppScore, initScore, bowler, addScore, score, setBowl, oppnBat, oppScore, bowl):BattingSecond(actualBowl, addOppnScore, reset, initOppScore, initScore, bowler, addScore, score, setBowl, oppnBat, oppScore, bowl),
        ),
      ),
    );
  }
}
