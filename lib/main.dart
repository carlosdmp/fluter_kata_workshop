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

  void _addCard(String name) {
    if (name != null) {
      setState(() {
        _models.add(new Model(text: name, id: getNextId(_models)));
      });
    }
  }

  void deleteCard(int index) {
      setState(() {
        _models.removeAt(index);
      });
  }

  void _showNewNoteDialog() {
    showDialog<String>(context: context, builder: (_) => new NoteDialog())
        .then(_addCard);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        itemCount: _models.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new DetailScreen(model: _models[index],)),
              );
            },
            child: Dismissible(
              key: new Key(_models[index].id.toString()),
              onDismissed: (_) {
                deleteCard(index);
              },
              child: new Card(
                child: ListTile(
                  title: new Text(_models[index].text),
                  subtitle: new Text(
                    "index: " + _models[index].id.toString(),
                  ),
                  leading: new CircleAvatar(
                      child: new Text(_models[index].id.toString())),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _showNewNoteDialog,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }
}
