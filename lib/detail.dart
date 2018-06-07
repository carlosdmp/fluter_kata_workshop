import 'package:flutter/material.dart';
import 'package:flutter_kata/model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({this.model});

  Model model;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
        new CircleAvatar(
          child: new Text(model.id.toString()),
          radius: 30.0,
        ),
        new Divider(),
        new Container(
          margin: EdgeInsets.only(top: 10.0),
            child: new Text(model.text)
        ),
          ],
        ),
      ),
    );
  }
}
