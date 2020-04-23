import 'package:flutter/material.dart';
import 'package:flutterapiapplication/main.dart';

class detailsPage extends StatefulWidget {
  detailsPage(User user);

  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Details page"),

      ),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
          Padding(
          child: new Text(
            'PASSED VALUES',
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.only(bottom: 20.0),
        ),
        ],
    ),
        )
      ),
    );
  }
}

