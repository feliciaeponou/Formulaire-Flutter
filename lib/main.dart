import 'package:flutter/material.dart';
import './inscription.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Connexion'),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Raja'),
              accountEmail: new Text('testemail@test.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            new ListTile(
              title: new Text('Inscription'),
              onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
              context,
              new MaterialPageRoute(
              builder: (BuildContext context) => new InscriptionPage()));
            }
            )
        ],
      ),
    ),
     body : Form(),
    );
  }
}

class Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Container(
        padding : EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        // Column is a vertical, linear layout.
        child: Container(
          child: ListView(
            children: <Widget>[
              Text("Entrez votre addresse mail"),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'abcdefg@opq.yz'
                ),
              ),
              Text("                    "),
              Text("Entrez votre mot de passe"),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffix:  IconButton(icon: Icon(Icons.visibility), onPressed: () {}) ,
                ),
              ),
              Text("                    "),
              RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                },
                child: Text('Submit'),
              )
            ],
          ),
        )
    );
  }
}