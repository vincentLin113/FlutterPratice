import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
  final _isCorrect;
  final VoidCallback _tap;

  CorrectWrongOverlay(this._isCorrect, this._tap);

  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

Animation<double> _iconAnimation;
AnimationController _iconAnimationController;

@override
void dispose() {
  _iconAnimationController.dispose();
  super.dispose();
}

@override
void initState() {
  super.initState();
  _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
  _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
  _iconAnimationController.addListener(() => this.setState(() {}));
  _iconAnimationController.forward();
}

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._tap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: new Icon(widget._isCorrect ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            new Text(
              widget._isCorrect ? 'Correct!' : 'False!',
              style: TextStyle(fontSize: 40.0, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
