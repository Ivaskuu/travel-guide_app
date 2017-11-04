import 'package:flutter/material.dart';
import 'lista_citta.dart';
import 'screen_citta.dart';

class ListaCittaScreen extends StatelessWidget
{
  PageController controller = new PageController();
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      body: new PageView.builder
      (
        itemBuilder: (_, int i) => new CopertinaCitta(ListaCitta.listaCitta[i]),
        itemCount: ListaCitta.listaCitta.length,
        controller: controller,
      )
    );
  }
}

class CopertinaCitta extends StatelessWidget
{
  final Citta citta;
  CopertinaCitta(this.citta);

  Widget build(BuildContext context)
  {
    return new Container
    (
      decoration: new BoxDecoration
      (
        image: new DecorationImage
        (
          image: new AssetImage(citta.img),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black45, BlendMode.luminosity)
        )
      ),
      child: new Stack
      (
        children: <Widget>
        [
          new Align
          (
            alignment: FractionalOffset.topLeft,
            child: new Container
            (
              margin: new EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0),
              child: new Text(citta.nome.toUpperCase(), style: new TextStyle(color: Colors.white, fontSize: 90.0, fontWeight: FontWeight.w700)),
            )
          ),
          new Align
          (
            alignment: FractionalOffset.bottomCenter,
            child: new Container
            (
              margin: new EdgeInsets.all(16.0),
              child: new FloatingActionButton
              (
                backgroundColor: Colors.white,
                child: new Icon(Icons.keyboard_arrow_up, color: Colors.black),
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new ScreenCitta(citta)))
              )
            )
          ),
        ],
      )
    );
  }
}