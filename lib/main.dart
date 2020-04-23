import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'detailsPage.dart';


void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=> new HomePageState();
}

class User{
  final String name,username, email, phone;

  const User(
      {
        this.name,
        this.username,
        this.email,
        this.phone
      }
      );
}



class HomePageState extends State<HomePage>{

  final String url = "https://jsonplaceholder.typicode.com/users";
  List data;




  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"}
    );

    print(response.body);

    setState(() {
      data = jsonDecode(response.body);
//      data = convertDateToJson['users'];
    });

    return "Success";
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Api Application"),
        ),
      body: new ListView.builder(
        itemCount:data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => new detailsPage(
                   User(
                    name: data[index]['name'],
                    username: data[index]['username'],
                    email: data[index]['email'],
                    phone: data[index]['phone'],

                  )
              ),
              ),
              );
            },
            child: new Container(
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                      new Card(
                        child: Stack(
                          children: <Widget>[
                            new Container(
                                child: new Text(data[index]['name'],
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 20.0, 0, 40.0)
                            ),
                            new Container(
                                child: Text(data[index]['email']),
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 40, 0, 20.0)
                            ),
                          ],
                        ),

                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      );
  }
}




