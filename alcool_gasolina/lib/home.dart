import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";


  void _calcular(){

    double? precoAlcool = double.tryParse(_controllerAlcool.text.replaceAll(',', '.'));
    double? precoGasolina = double.tryParse(_controllerGasolina.text.replaceAll(',', '.'));

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.) ou (,)";
      });
    }else{

      /*
      * Se o preço do álcool divido pelo preço da gasolina
      * for >= a 0.7 é melhor abastecer com gasolina
      * senão é melhor utilizar álcool
      * */
      if( (precoAlcool / precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
    }


  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59"
              ),
              style: const TextStyle(
                  fontSize: 22
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.59"
              ),
              style: const TextStyle(
                  fontSize: 22
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(15),
                ),
                  onPressed: _calcular,
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                    ),
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                    onPressed: _limparCampos,
                    child: const Text("Limpar campos")
                  ),
                ])
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                _textoResultado,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
