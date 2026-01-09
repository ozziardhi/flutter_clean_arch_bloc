import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/profile.dart';

abstract class Profiledatasource {
  Future<Profilemodel> getUser(int id);
  Future<List<Profilemodel>> getalluser(int page);
}

class ProfiledatasourceImplementation extends Profiledatasource {
  static const _baseUrl = 'https://reqres.in/api';

  static const _headers = {
    'x-api-key':
        'reqres_9e834b97b6a346dfbb871b511be25144', // wajib sekarang di ReqRes
    'Content-Type': 'application/json',
  };

  @override
  Future<Profilemodel> getUser(int id) async {
    final url = Uri.parse("$_baseUrl/users/$id");

    var response = await http.get(url, headers: _headers);
    if (response.statusCode != 200) {
      final dataBody = jsonDecode(response.body) as Map<String, dynamic>;
      final data = dataBody['data'];

      return Profilemodel.fromJson(data);
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<List<Profilemodel>> getalluser(int page) async {
    final url = Uri.parse("$_baseUrl/users?page=$page");

    final response = await http.get(url, headers: _headers);

    final dataBody = jsonDecode(response.body) as Map<String, dynamic>;
    final rawData = dataBody['data'];

    return Profilemodel.fromJsonList(rawData.cast<Map<String, dynamic>>());
  }
}
