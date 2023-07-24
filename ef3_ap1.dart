import 'package:flutter/material.dart';

enum Genero { Masculino, Feminino, outro }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String nome = '';
  String idade = '';
  bool aceitoTermos = false;
  Genero genero = Genero.outro;
  bool inativo = false;

  bool _validateNome(String value) {
    if (value.isEmpty ||
        value.length < 3 ||
        !value[0].toUpperCase().contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    return true;
  }

  bool _validateIdade(String value) {
    int idade = int.tryParse(value) ?? 0;
    if (idade >= 18) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Página de cadastro')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Insira seus dados',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  onChanged: (text) {
                    setState(() {
                      nome = text;
                    });
                  }),
              if (!_validateNome(nome))
                Text('Nome inválido', style: TextStyle(color: Colors.red)),
              TextField(
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                  ),
                  onChanged: (text) {
                    setState(() {
                      idade = text;
                    });
                  }),
              if (!_validateIdade(idade))
                Text('Idade inválida', style: TextStyle(color: Colors.red)),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_validateNome(nome) && _validateIdade(idade)) {
                          setState(() {
                            inativo = !aceitoTermos;
                          });
                          print('Nome: $nome');
                          print('Idade: $idade');
                        } else {
                          print(
                              'Formulário inválido. Por favor, corrija os campos destacados em vermelho.');
                        }
                      },
                      child: Text('ENTRAR'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
