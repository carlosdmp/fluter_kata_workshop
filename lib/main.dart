import 'package:flutter/material.dart';
import 'package:flutter_kata/detail.dart';
import 'package:flutter_kata/dialog.dart';
import 'package:flutter_kata/model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Kata',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Kata'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Model> _models = new List();

  void _addCards() {
    _models.clear();
    _models.add(new Model(text: "Card 1", id: 1));
    _models.add(new Model(text: "Card 2", id: 2));
  }

  @override
  Widget build(BuildContext context) {
    _addCards();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          new Text(_models[0].text),
          new Text(_models[1].text),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }
}
