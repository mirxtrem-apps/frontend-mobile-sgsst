import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../app/config/config.dart';

class ApiRepository extends Config {
  final httpClient = http.Client();

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    if (token != null) {
      Config.headers?.addAll({'Authorization': token});
    }

    final url = Uri.https(
      Config.baseUrl,
      endpoint,
      queryParameters,
    );

    debugPrint(url.toString());

    return httpClient.get(
      url,
      headers: Config.headers,
    );
  }

  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? token,
  }) async {
    if (token != null) {
      Config.headers = {'Authorization': token};
    }

    final url = Uri.https(
      Config.baseUrl,
      endpoint,
      queryParameters,
    );

    debugPrint(url.toString());

    return httpClient.post(
      url,
      body: body,
    );
  }

  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? token,
  }) async {
    if (token != null) {
      Config.headers = {'Authorization': token};
    }

    final url = Uri.https(
      Config.baseUrl,
      endpoint,
      queryParameters,
    );

    debugPrint(url.toString());

    return httpClient.put(
      url,
      body: body,
    );
  }

  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? token,
  }) async {
    if (token != null) {
      Config.headers?.addAll({'Authorization': token});
    }

    final url = Uri.https(
      Config.baseUrl,
      endpoint,
      queryParameters,
    );

    return httpClient.delete(
      url,
      body: body,
    );
  }
}
