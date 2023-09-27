import 'package:contatos/model/contato_model.dart';
import 'package:contatos/repository/custom_dio.dart';

class ContatosRepo {
  final _customDio = ContatoCustomDio();

  ContatosRepo();

  Future<ContatosModel> get() async {
    var result = await _customDio.dio.get('');
    return ContatosModel.fromJson(result.data);
  }

  Future<void> post(ContatoModel contatoModel) async {
    try {
      await _customDio.dio.post('', data: contatoModel.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
