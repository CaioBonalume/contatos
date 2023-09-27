import 'package:flutter/material.dart';
import 'package:contatos/model/contato_model.dart';

class EditarContatoPage extends StatefulWidget {
  final ContatoModel contatoEdit;
  EditarContatoPage({super.key, required this.contatoEdit});

  @override
  State<EditarContatoPage> createState() => _EditarContatoPageState();
}

class _EditarContatoPageState extends State<EditarContatoPage> {
  late ContatoModel contato;

  @override
  void initState() {
    super.initState();
    contato = widget.contatoEdit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Contato'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          children: [
            // TODO: Colocar pre-setado os campos, precisando só alterar o que já tem
            // Talvez utilizando controller: contato.nome, e dps alterar o valor de contato.nome
            TextFormField(
              decoration: InputDecoration(hintText: contato.nome),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: contato.telefone),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: contato.email),
            ),
          ],
        ),
      ),
    );
  }
}
