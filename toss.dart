import 'package:flutter/material.dart';

class Toss extends StatelessWidget {
  final Function setToss;
  
  Toss(this.setToss);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Toss Time',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          RaisedButton(child: Text('Heads'),onPressed: () => setToss(1)),
          RaisedButton(child: Text('Tails'),onPressed: () => setToss(2)),
        ],
      ),
    );
  }
}
