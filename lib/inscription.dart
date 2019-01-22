import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => new _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {

  String phpMsg;
  String regInfo;

  TextEditingController nom = new TextEditingController();
  TextEditingController prenom = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController email= new TextEditingController();

  sendData() async{
    var url = 'http://192.168.43.222/flutter/index.php'; //or https
    var data = {"userlastname":nom.text,"username":prenom.text,"email" : email.text, "password" : pass.text};

    http.post(url, body:data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }).catchError((error) => print(error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Inscription'),
      ),
      body: Container(
          padding : EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          // Column is a vertical, linear layout.
          child: Container(
            child: ListView(
              children: <Widget>[
                Text("                    "),
                Text("                    "),
                Text("                    "),
                Text("Entrez votre nom"),
                TextFormField(
                  controller: nom,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ''
                  ),
                ),
                Text("                    "),
                Text("Entrez votre prénom"),
                TextFormField(
                  controller: prenom,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ''
                  ),
                ),
                Text("                    "),
                Text("Entrez votre adresse mail"),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ''
                  ),
                ),
                Text("                    "),
                Text("Entrez votre mot de passe"),
                TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                    suffix:  IconButton(icon: Icon(Icons.visibility), onPressed: () {}) ,
                  ),
                ),
                Text("                    "),
                RaisedButton(
                  onPressed: () {
                    sendData();
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                  },
                  child: Text('Je m\'inscris'),
                )
              ],
            ),
          )
      )
    );
  }
}

