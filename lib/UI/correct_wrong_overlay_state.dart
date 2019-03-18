import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {
  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => print('You tapped the overlay'),
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Icon(Icons.done),
            ),
            new Text('Correct!')
          ],
        ),
      ),
    )
  }
}