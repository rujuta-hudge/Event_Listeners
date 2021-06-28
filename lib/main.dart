import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Event Listeners"),
          centerTitle: true,
        ),
        body: Center(
          child: MyApp(),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  List data = [
    Colors.brown,
    Colors.pink,
    Colors.indigo,
    Colors.green,
    Colors.red,
    Colors.teal,
    Colors.orangeAccent
  ];
  int _currentColorIndex = 0;

  void changecolor() async {
    setState(() {
      if (_currentColorIndex < data.length - 1) {
        _currentColorIndex++;
      } else {
        _currentColorIndex = 0;
      }
    });
  }

  double custFontSize = 22;

  void changeFontSize() async {
    setState(() {
      custFontSize += 2;
    });
    if (custFontSize == 34) custFontSize = 22;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Please Apply Changes Here!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: custFontSize,
                      color: data[_currentColorIndex],
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15),
              // ignore: deprecated_member_use
              RaisedButton(
                elevation: 8.0,
                splashColor: Colors.black38,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.red[100],
                onPressed: () {
                  changeFontSize();
                },
                child: Text(
                  'Change the Size',
                  style: TextStyle(fontFamily: "Times New Roman", fontSize: 20),
                ),
              ),
              SizedBox(height: 15),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.red[100],
                splashColor: Colors.black38,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 8.0,
                onPressed: () {
                  changecolor();
                },
                child: Text(
                  'Change The Color',
                  style: TextStyle(fontFamily: "Times New Roman", fontSize: 20),
                ),
              ),
            ]),
      ),
      backgroundColor: Colors.red[50],
    );
  }
}
