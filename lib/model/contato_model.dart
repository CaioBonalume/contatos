class ContatosModel {
  List<ContatoModel> contatos = [];

  ContatosModel(this.contatos);

  ContatosModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contatos = <ContatoModel>[];
      json['results'].forEach((v) {
        contatos.add(ContatoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = contatos.map((v) => v.toJson()).toList();
    return data;
  }
}

class ContatoModel {
  String objectId = '';
  String nome = '';
  String telefone = '';
  String email = '';
  String foto = '';
  String createdAt = '';
  String updatedAt = '';

  ContatoModel(this.objectId, this.nome, this.telefone, this.email, this.foto,
      this.createdAt, this.updatedAt);

  ContatoModel.post(this.nome, this.telefone, this.email, this.foto);

  ContatoModel.put(
      this.objectId, this.nome, this.telefone, this.email, this.foto);

  ContatoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    telefone = json['telefone'];
    email = json['email'];
    foto = json['foto'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['objectId'] = objectId;
    data['nome'] = nome;
    data['telefone'] = telefone;
    data['email'] = email;
    data['foto'] = foto;
    // data['createdAt'] = createdAt;
    // data['updatedAt'] = updatedAt;
    return data;
  }
}
