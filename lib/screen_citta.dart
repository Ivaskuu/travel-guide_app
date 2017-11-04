import 'package:flutter/material.dart';
import 'lista_citta.dart';
import 'screen_cerca_biglietto.dart';

class ScreenCitta extends StatefulWidget
{
  Citta _citta;
  ScreenCitta(this._citta);

  @override
  State createState() => new ScreenCittaState();
}

class ScreenCittaState extends State<ScreenCitta>
{
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        backgroundColor: Colors.white,
        title: new Text("${widget._citta.nome}"),
        actions: <Widget>
        [
          new IconButton(icon: new Icon(Icons.search), onPressed: () => null)
        ],
      ),
      body: new ListView.builder
      (
        itemBuilder: (_, int i) => new TileLuogo(widget._citta.luoghi[i]),
        itemCount: widget._citta.luoghi.length,
        scrollDirection: Axis.vertical,
      ),
      floatingActionButton: new FloatingActionButton
      (
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new ScreenCercaBiglietto())),
        child: new Icon(Icons.flight_takeoff),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}

class TileLuogo extends StatefulWidget
{
  final Luogo _luogo;
  TileLuogo(this._luogo);

  bool selected = true;

  @override
  State createState() => new TileLuogoState();
}

class TileLuogoState extends State<TileLuogo>
{
  Widget build(BuildContext context)
  {
    return new GestureDetector
    (
      onTap: () => setState(() => widget.selected = !widget.selected),
      onLongPress: () => _longPress(context),
      child: new Material
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
              image: new AssetImage(widget._luogo.img),
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
                      value: widget.selected,
                      onChanged: (bool newValue) => setState(() => widget.selected = newValue),
                    )
                  )
                ),
                new Align
                (
                  alignment: FractionalOffset.bottomLeft,
                  child: new Container
                  (
                    margin: new EdgeInsets.all(16.0),
                    child: new Text(widget._luogo.nome, style: new TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)),
                  )
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  void _longPress(BuildContext context)
  {
    showDialog
    (
      context: context,
      child: new SimpleDialog
      (
        contentPadding: new EdgeInsets.all(0.0),
        children: <Widget>
        [
          new Image.asset(widget._luogo.img),
          new Text(widget._luogo.nome, style: Theme.of(context).textTheme.title),
          new Text(widget._luogo.descrizione),
          //new Text(_luogo.posizione)
        ],
      )
    );
  }
}