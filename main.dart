import 'package:flutter/material.dart';
import './button.dart';
import './button1.dart';
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
      initBowl = actualBowl;
      actualBowl = bowl;
      initOppScore = oppScore;
      oppScore+=runs;
      //oppScore += 3;
      randomizer1 = new Random(); // can get a seed as a parameter
      oppnBat = randomizer1.nextInt(6) +
          1; // Integer between 0 and 6 (0 inclusiev 6 not)
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
    });
  }

  void setBowl() {
    setState(() {
      bowl = 1;
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
          child: bowler != (score - initScore)
              ? Column(
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
                  ],
                )
              : bowl == 0
                  ? Column(
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
                    )
                  : actualBowl != (oppScore - initOppScore) &&
                          oppScore <= initScore
                      ? Column(
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
                            Text(
                              'Target: ' + initScore.toString(),
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            Text(''),
                            RaisedButton(
                                child: Text('Start Again'), onPressed: reset),
                          ],
                        )
                      : Column(
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
                                child: Text('Start Again'), onPressed: reset),
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
                        ),
        ),
      ),
    );
  }
}
