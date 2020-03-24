import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final Function setStart;

  MainPage(this.setStart);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('\n\n\n\n\n\n\n\n'),
          Text(
            'Welcome To Hand Cricket 2020',
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          Text('\n\n'),
          Container(
            width: double.parse(150.toString()),
            margin: EdgeInsets.all(4),
            color: Color.fromRGBO(0, 255, 0, 0.7),
            child: RaisedButton(
                child: Text('Let\'s Play',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: setStart),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
