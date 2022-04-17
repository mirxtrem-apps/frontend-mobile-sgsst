import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:software_sgsst/src/data/services/api_service.dart';

class AccountRepository with ChangeNotifier {
  late ApiRepository _apiRepository;
  AccountRepository({required ApiRepository apiRepository}) {
    debugPrint('AuthRepository Implementation has been initialized');
    _apiRepository = apiRepository;
  }

  Future<Map<String, dynamic>> obtenerPerfil({
    required int userId,
  }) async {
    final response = await _apiRepository.get(
      endpoint: '/sgsst/api/v1/account/$userId',
    );

    Map<String, dynamic> jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse.toString());
    return jsonResponse;
  }
}
