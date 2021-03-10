import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool pedra;
  bool papel;
  bool tesoura;
  var resultadoJogador;
  var texto = 'Jogar';

  executar() {
     var num_aleatorio = Random().nextInt(2);
     var resultado;
     if (pedra) { 
       if (num_aleatorio == 0) {
         resultado = "Você empatou!";
       }
       if (num_aleatorio == 1) {
         resultado = "Você perdeu!";
       }
       if (num_aleatorio == 3) {
         resultado = "VOCÊ VENCEU!";
       }

       if (papel) { 
          if (num_aleatorio == 0) {
            resultado = "VOCÊ VENCEU!";
          }
          if (num_aleatorio == 1) {
            resultado = "Você empatou!";
          }
          if (num_aleatorio == 3) {
            resultado = "Você perdeu!";
          }
       }

        if (tesoura) { 
          if (num_aleatorio == 0) {
            resultado = "Você perdeu!";
          }
          if (num_aleatorio == 1) {
            resultado = "VOCÊ VENCEU!";
          }
          if (num_aleatorio == 3) {
            resultado = "Você empatou!";
          }
       }
       
     setState(() {
      this.texto = resultado;
    });
  }
   
  }
  

  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home:  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('JokenPO!'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1, 
            child: Container(
                width: double.infinity,
                child: Image.asset('assets/images/jokenpo.jpg'),
              ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 2, 
            child: Column(
              children: [
                CheckboxListTile(
                    title: const Text('Pedra'),
                    value: timeDilation != 1.0,
                     onChanged: (bool value) {
                       setState(() { 
                         this.pedra = value;
                          timeDilation = pedra ? 10.0 : 1.0; },
                         );
                      },
                ),
                CheckboxListTile(
                    title: const Text('Papel'),
                    value: papel,
                     onChanged: (bool value) {
                       setState(() { 
                         this.papel = value;
                        },
                         );
                      },
                      activeColor: Colors.blue,
                       checkColor: Colors.green,
                ),
                CheckboxListTile(
                    title: const Text('Tesoura'),
                    value: tesoura,
                     onChanged: (bool value) {
                       setState(() { 
                         this.tesoura = value;
                        },
                         );
                      },
                      activeColor: Colors.blue,
                       checkColor: Colors.green,
                ),
                   Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        texto,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        executar();
                      }
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}