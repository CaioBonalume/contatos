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

  Future<void> put(ContatoModel contatoModel) async {
    var url = '/${contatoModel.objectId}';
    try {
      await _customDio.dio.put(url, data: contatoModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String objectId) async {
    var url = '/$objectId';
    try {
      await _customDio.dio.delete(url);
    } catch (e) {
      rethrow;
    }
  }
}
