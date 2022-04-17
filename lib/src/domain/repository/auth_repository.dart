import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:software_sgsst/src/data/services/api_service.dart';

class AuthRepository with ChangeNotifier {
  late ApiRepository _apiRepository;
  AuthRepository({required ApiRepository apiRepository}) {
    debugPrint('AuthRepository Implementation has been initialized');
    _apiRepository = apiRepository;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiRepository.post(
      endpoint: '/sgsst/api/v1/auth/login',
      body: {"correo": email, "password": password},
    );

    Map<String, dynamic> jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse.toString());
    return jsonResponse;
  }

  registro({required String email, required String password}) async {
    final response =
        await _apiRepository.post(endpoint: '/sgsst/api/v1/auth/registro');
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      debugPrint(jsonResponse);
    }
  }

  resetPassword({required String email, required String password}) async {
    final response =
        await _apiRepository.get(endpoint: '/sgsst/api/v1/auth/reset-password');
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      debugPrint(jsonResponse['data']);
    }
  }
}
