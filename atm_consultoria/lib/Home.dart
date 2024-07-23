import 'package:flutter/material.dart';
import 'TelaClientes.dart';
import 'TelaContato.dart';
import 'TelaEmpresa.dart';
import 'TelaServico.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _abrirEmpresa(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TelaEmpresa() ));
  }

  void _abrirServico(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TelaServico() ));
  }

  void _abrirContato(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TelaContato() ));
  }

  void _abrirClientes(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TelaClientes() ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "ATM Consultoria",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirEmpresa,
                    child: Image.asset("images/menu_empresa.png"),
                  ),
                  GestureDetector(
                    onTap: _abrirServico,
                    child: Image.asset("images/menu_servico.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirClientes,
                    child: Image.asset("images/menu_cliente.png"),
                  ),
                  GestureDetector(
                    onTap: _abrirContato,
                    child: Image.asset("images/menu_contato.png"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
