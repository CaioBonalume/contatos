import 'package:contatos/model/contato_model.dart';
import 'package:contatos/repository/contatos_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistroContatoPage extends StatefulWidget {
  const RegistroContatoPage({super.key});

  @override
  State<RegistroContatoPage> createState() => _RegistroContatoPageState();
}

class _RegistroContatoPageState extends State<RegistroContatoPage> {
  var controllerNome = TextEditingController(text: '');
  var controllerTelefone = TextEditingController(text: '');
  var controllerEmail = TextEditingController(text: '');

  ContatosRepo contatosRepo = ContatosRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Text(
            'Cadastro de Contato',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controllerNome,
            decoration: const InputDecoration(
                hintText: 'Digite o nome',
                hintStyle: TextStyle(color: Colors.purple)),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 11,
            decoration: const InputDecoration(
              counterText: '',
              labelText: 'Celular',
              labelStyle:
                  TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
              hintText: '(xx) xxxxx-xxxx',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value!.length != 11) {
                return 'O celular precisa conter 11 dígitos';
              }
              return null;
            },
            controller: controllerTelefone,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: controllerEmail,
            decoration: const InputDecoration(
                hintText: 'Digite um email',
                hintStyle: TextStyle(color: Colors.purple)),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              if (controllerEmail.text.isNotEmpty &&
                  controllerTelefone.text.isNotEmpty &&
                  controllerNome.text.isNotEmpty) {
                await contatosRepo.post(ContatoModel.post(controllerNome.text,
                    controllerTelefone.text, controllerEmail.text));
              }
              setState(() {
                Navigator.pop(context);
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Cadastrar',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
