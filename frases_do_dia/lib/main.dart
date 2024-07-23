import 'dart:math';

import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  var _frases = [
    "Primeira frase para testar",
    "Segunda frase para testar, essa vai ser um pouco maior",
    "third: The testing for a phrase-generating app has been successfully completed.",
    "quarta: mais um teste",
    "quinto teste",
    "sexto e ultimo teste",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Frases do dia",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
        ) ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
              onPressed: _gerarFrase,
              child: const Text(
                  "Nova frase",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            )
          ]
        )
      )
    );
  }
}