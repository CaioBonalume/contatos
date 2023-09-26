import 'package:flutter/material.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({super.key});

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
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
            onPressed: () {},
          ),
          const SizedBox(height: 5),
          const Divider(indent: 20, endIndent: 20),
          const SizedBox(height: 5),
          const Text('Todos')
        ],
      ),
    );
  }
}
