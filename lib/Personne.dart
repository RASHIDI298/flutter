import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Personne extends StatefulWidget {
  const Personne({Key? key}) : super(key: key);

  @override
  State<Personne> createState() => _PersonneState();
}

class _PersonneState extends State<Personne> {
  TextEditingController txtnom = new TextEditingController();
  TextEditingController txtpostnom = new TextEditingController();
  TextEditingController txtprenom = new TextEditingController();
  TextEditingController txtgenre = new TextEditingController();
  TextEditingController txtemail = new TextEditingController();
  TextEditingController txttelephone = new TextEditingController();
  TextEditingController txtetat = new TextEditingController();
  TextEditingController txtid = new TextEditingController();

  //fonction asych

  Future<void> AddData() async {
    var url = "http://172.20.10.2/Tp/insertion.php";
    final reponse = await http.post(Uri.parse(url), body: {
      "nom": txtnom.text,
      "postnom": txtpostnom.text,
      "prenom": txtprenom.text,
      "genre": txtgenre.text,
      "email": txtemail.text,
      "telephone": txttelephone.text,
      "etat": txtetat.text
    });
    Catch(ex) {
      print(ex.toString());
    }
  }
    Future<void> UpdateData() async {
    var url = "http://172.20.10.2/Tp/modification.php";
    final reponse = await http.post(Uri.parse(url), body: {
      "nom": txtnom.text,
      "postnom": txtpostnom.text,
      "prenom": txtprenom.text,
      "genre": txtgenre.text,
      "email": txtemail.text,
      "telephone": txttelephone.text,
      "etat": txtetat.text,
      "Id": txtid.text
    });
    Catch(ex) {
      print(ex.toString());
    }
  }
  Future<void> DeleteData() async {
    var url = "http://172.20.10.2/Tp/suppression.php";
    final reponse = await http.post(Uri.parse(url), body: {
      "Id": txtid.text
    });
    Catch(ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ENREGISTREMENT"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
           new TextField(
            controller: txtid,
            decoration: InputDecoration(
                labelText: "Entrez votre Id",
                hintText: "Entrez votre Id"),
          ),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txtnom,
            decoration: InputDecoration(
                labelText: "Entrez votre nom",
                hintText: "Entrez votre nom"),
          ),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txtpostnom,
            decoration: InputDecoration(
                labelText: "Entrez votre postnom",
                hintText: "Entrez votre postnom"),
          ),
          SizedBox(
            width: 20,
          ),
          new TextField(
            controller: txtprenom,
            decoration: InputDecoration(
                labelText: "Entrez votre prenom",
                hintText: "Entrez votre prenom"),
          ),
          new TextField(
            controller: txtgenre,
            decoration: InputDecoration(
                labelText: "Entrez votre genre",
                hintText: "Entrez votre genre"),
          ),
          new TextField(
            controller: txtemail,
            decoration: InputDecoration(
                labelText: "Entrez votre email",
                hintText: "Entrez votre email"),
          ),
          new TextField(
            controller: txttelephone,
            decoration: InputDecoration(
                labelText: "Entrez votre numéro de téléphone",
                hintText: "Entrez votre numéro de téléphone"),
          ),
           new TextField(
            controller: txtetat,
            decoration: InputDecoration(
                labelText: "Entrez votre état civil",
                hintText: "Entrez votre état civil"),
          ),
          SizedBox(
            width: 20,
          ),
          new RaisedButton(
            onPressed: () {
              AddData();
            },
            child: Text("Enregistrer"),
            color: Colors.greenAccent,
          ),
           new RaisedButton(
            onPressed: () {
            UpdateData();
            },
            child: Text("Modifier"),
            color: Colors.blueAccent,
          ),
           new RaisedButton(
            onPressed: () {
              DeleteData();
            },
            child: Text("Supprimer"),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
