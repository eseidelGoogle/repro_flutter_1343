import 'package:flutter/material.dart';
import 'package:flutter/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    new MaterialApp(
      title: "Flutter Demo",
      routes: <String, RouteBuilder>{
        '/': (RouteArguments args) => new FlutterDemo()
      }
    )
  );
}

class FlutterDemo extends StatefulComponent {
  @override
  State createState() => new FlutterDemoState();
}

class FlutterDemoState extends State {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
    print("posting");
    String lUrl = 'http://localhost:9999';
    Map lMap = {"Foo1": "Bar1", "Foo2": "Bar2"};
    String lData = JSON.encode(lMap);

    Map lHeaders = {"Content-type": "application/json", "Accept": "application/json"};

    http.post(lUrl, body: lData, headers: lHeaders).then((http.Response lResp) {
      print(lResp);
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text("Flutter Demo")
      ),
      body: new Material(
        child: new Center(
          child: new Text("Button tapped $counter times.")
        )
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          icon: 'content/add'
        ),
        onPressed: incrementCounter
      )
    );
  }
}
