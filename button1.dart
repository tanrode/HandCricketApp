import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final Function addOppnScore;
  final int runs;
  final int bowler;

  Button1(this.addOppnScore,this.bowler,this.runs);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.parse(90.toString()),
      margin: EdgeInsets.all(4),
      color: Color.fromRGBO(0, 255, 0, 0.7),
      child: RaisedButton(child: Text(bowler.toString(),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,)),onPressed: () => addOppnScore(runs,bowler)),
    );
  }
}