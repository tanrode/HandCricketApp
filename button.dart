import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function addScore;
  final int runs;
  final int bowler;

  Button(this.addScore,this.runs,this.bowler);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.parse(90.toString()),
      margin: EdgeInsets.all(4),
      color: Color.fromRGBO(0, 255, 0, 0.7),
      child: RaisedButton(child: Text(runs.toString(),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,)),onPressed: () => addScore(runs)),
    );
  }
}