import 'package:contatos/model/contato_model.dart';
import 'package:contatos/pages/editar_contato.dart';
import 'package:contatos/pages/registrar_contato.dart';
import 'package:contatos/repository/contatos_repo.dart';
import 'package:flutter/material.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({super.key});

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  ContatosRepo contatosRepo = ContatosRepo();
  var _contatosRepo = ContatosModel([]);
  bool loading = false;

  @override
  void initState() {
    super.initState();
    get();
  }

  Future<void> get() async {
    _contatosRepo = await contatosRepo.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextButton(
            child: Card(
              color: Colors.amber.shade300,
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Criar um contato',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistroContatoPage()));
            },
          ),
          const SizedBox(height: 5),
          const Divider(indent: 20, endIndent: 20),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RefreshIndicator(
                onRefresh: get,
                child: ListView.builder(
                  itemCount: _contatosRepo.contatos.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var contato = _contatosRepo.contatos[index];
                    return Card(
                      key: Key(contato.objectId),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 100,
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                contato.nome,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(contato.telefone),
                              const SizedBox(height: 18),
                              Text(contato.email)
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditarContatoPage(
                                                    contatoEdit:
                                                        ContatoModel.put(
                                                            contato.objectId,
                                                            contato.nome,
                                                            contato.telefone,
                                                            contato.email))));
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () async {
                                    await contatosRepo.delete(contato.objectId);
                                    get();
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
