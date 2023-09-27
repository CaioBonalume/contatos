import 'package:contatos/repository/contatos_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContatoCustomDio {
  final _dio = Dio();
  Dio get dio => _dio;

  ContatoCustomDio() {
    _dio.options.baseUrl = dotenv.get('BASE_URL');
    _dio.interceptors.add(ContatosInterceptor());
  }
}
