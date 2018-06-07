import 'package:flutter/material.dart';

class NoteDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DialogState();
  }
}

class _DialogState extends State<NoteDialog> {
  String _input = "";

  void _accept() {
    Navigator.pop(context, _input);
  }

  @override
  Widget build(BuildContext context) {
    return new Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text("New note", style: TextStyle(fontSize: 24.0)),
            new Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: new TextField(
                decoration: new InputDecoration(border: OutlineInputBorder()),
                onChanged: (text) {
                  setState(() {
                    _input = text;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.send,
                    ),
                    disabledColor: Colors.grey,
                    color: Colors.blue,
                    onPressed: (_input != null && _input!= "") ? _accept : null),
              ],
            )
          ],
        ),
      ),
    );
  }
}
