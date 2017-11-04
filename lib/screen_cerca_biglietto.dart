import 'package:flutter/material.dart';
import 'lista_citta.dart';
import 'dart:math';

class ScreenCercaBiglietto extends StatefulWidget
{
  @override
  State createState() => new ScreenCercaBigliettoState();
}

class ScreenCercaBigliettoState extends State<ScreenCercaBiglietto>
{
  int currentStep = 1;

  @override
  Widget build (BuildContext context)
  {
    return new Scaffold
    (
      body: new Center
      (
        child: new Stack
        (
          alignment: FractionalOffset.center,
          children: <Widget>
          [
            new Align
            (
              alignment: FractionalOffset.topRight,
              child: new Container
              (
                margin: new EdgeInsets.only(top: 24.0),
                child: new FlatButton
                (
                  child: new Text("CANCEL"),
                  onPressed: () => Navigator.pop(context),
                )
              )
            ),
            new Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                new Stack
                (
                  alignment: FractionalOffset.center,
                  children: <Widget>
                  [
                    new RotatedBox
                    (
                      quarterTurns: 1,
                      child: new Icon(Icons.flight, size: 64.0, color: Colors.black),
                    ),
                    new SizedBox.fromSize
                    (
                      size: new Size.fromRadius(48.0),
                      child: new CircularProgressIndicator(),
                    )
                  ],
                ),
                new Container
                (
                  margin: new EdgeInsets.only(top: 64.0),
                  child: new Text("3/64", style: Theme.of(context).textTheme.title)
                ),
                new Container
                (
                  margin: new EdgeInsets.only(top: 32.0),
                  child: new Text("Searching for the lowest plane ticket price...")
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}