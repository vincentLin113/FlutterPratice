import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: _answer ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
              child: new Container(
            decoration: BoxDecoration(
              border: new Border.all(color: Colors.white, width: 5.0),
            ),
            padding: EdgeInsets.all(20),
            child: new Text(_answer ? "True" : "False",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
          )),
        ),
      ),
    );
  }
}
