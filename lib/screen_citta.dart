import 'package:flutter/material.dart';

class ScreenCitta extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        backgroundColor: Colors.white,
        title: new Text("Kyoto (4/4)"),
        actions: <Widget>
        [
          new IconButton(icon: new Icon(Icons.search), onPressed: () => null)
        ],
      ),
      body: new ListView
      (
        scrollDirection: Axis.vertical,
        children: <Widget>
        [
          new TileLuogo("Tempio Kiyomizu", "res/citta/kyoto-0.jpg"),
          new TileLuogo("Fushimi Inari", "res/citta/kyoto-1.jpg"),
          new TileLuogo("Arashyana", "res/citta/kyoto-2.jpg"),
          new TileLuogo("Tempio Nanzen-ji", "res/citta/kyoto-3.jpg"),
        ],
      ),
      floatingActionButton: new FloatingActionButton
      (
        onPressed: () => null,
        child: new Icon(Icons.flight_takeoff),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }

  Widget pillButton()
  {
    return new Container
    (
      margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: new Material
      (
        elevation: 8.0,
        borderRadius: new BorderRadius.circular(32.0),
        child: new InkWell
        (
          onTap: () => null,
          child: new Container
          (
            decoration: new BoxDecoration
            (
              borderRadius: new BorderRadius.circular(32.0),
              gradient: new LinearGradient
              (
                colors: [Colors.amberAccent, Colors.greenAccent],
              ),
            ),
            child: new Text("VAI", textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            padding: new EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
          ),
        )
      )
    );
  }
}

class TileLuogo extends StatelessWidget
{
  String _nomeLuogo;
  String _img;
  TileLuogo(this._nomeLuogo, this._img);

  bool selected = true;

  Widget build(BuildContext context)
  {
    return new Material
    (
      elevation: 8.0,
      child: new Container
      (
        margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: new BoxDecoration
        (
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          image: new DecorationImage
          (
            image: new AssetImage(_img),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black45, BlendMode.luminosity)
          )
        ),
        child: new SizedBox.fromSize
        (
          size: new Size.fromHeight(180.0),
          child: new Stack
          (
            children: <Widget>
            [
              new Align
              (
                alignment: FractionalOffset.topRight,
                child: new Container
                (
                  margin: new EdgeInsets.all(8.0),
                  child: new Checkbox
                  (
                    value: selected,
                    onChanged: (bool newValue) => selected = newValue,
                  )
                )
              ),
              new Align
              (
                alignment: FractionalOffset.bottomLeft,
                child: new Container
                (
                  margin: new EdgeInsets.all(16.0),
                  child: new Text(_nomeLuogo, style: new TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)),
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}