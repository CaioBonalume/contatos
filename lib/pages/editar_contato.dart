import 'dart:io';

import 'package:flutter/material.dart';
import 'package:contatos/model/contato_model.dart';
import 'package:image_picker/image_picker.dart';

class EditarContatoPage extends StatefulWidget {
  final ContatoModel contatoEdit;
  EditarContatoPage({super.key, required this.contatoEdit});

  @override
  State<EditarContatoPage> createState() => _EditarContatoPageState();
}

class _EditarContatoPageState extends State<EditarContatoPage> {
  late ContatoModel contato;
  final avt = 'assets/images/avatar.png';

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
            SizedBox(
                width: 200,
                height: 200,
                child: (contato.foto != avt)
                    ? CircleAvatar(
                        child: ClipOval(
                        child: Image.file(File(contato.foto),
                            height: 200, width: 200, fit: BoxFit.cover),
                      ))
                    : CircleAvatar(
                        child: ClipOval(
                        child: Image.asset(avt),
                      ))),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Galeria'),
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: contato.nome),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: contato.telefone),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: contato.email),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      'Atualizar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
