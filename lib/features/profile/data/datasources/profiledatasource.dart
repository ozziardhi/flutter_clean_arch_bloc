import 'dart:convert';

import 'package:cleanarch/core/error/exception.dart';

import 'package:http/http.dart' as http;

import '../models/profile.dart';

abstract class Profiledatasource {
  Future<Profilemodel> getUser(int id);
  Future<List<Profilemodel>> getalluser(int page);
}

class ProfiledatasourceImplementation extends Profiledatasource {
  final http.Client client;

  ProfiledatasourceImplementation({required this.client});

  static const _baseUrl = 'https://reqres.in/api';

  static const _headers = {
    'x-api-key':
        'reqres_9e834b97b6a346dfbb871b511be25144', // wajib sekarang di ReqRes
    'Content-Type': 'application/json',
  };

  @override
  Future<Profilemodel> getUser(int id) async {
    final url = Uri.parse("$_baseUrl/users/$id");

    final response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      final dataBody = jsonDecode(response.body) as Map<String, dynamic>;
      final data = dataBody['data'] as Map<String, dynamic>;

      return Profilemodel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw const EmptyException(message: 'User not found');
    } else {
      throw GeneralException(message: 'cannot get user data');
    }
  }

  @override
  Future<List<Profilemodel>> getalluser(int page) async {
    final url = Uri.parse("$_baseUrl/users?page=$page");

    var response = await client.get(url, headers: _headers);

    if (response.statusCode != 200) {
      final dataBody = jsonDecode(response.body) as Map<String, dynamic>;
      final rawData = dataBody['data'];

      return Profilemodel.fromJsonList(rawData.cast<Map<String, dynamic>>());
    } else if (response.statusCode == 404) {
      throw const EmptyException(message: 'Users not found');
    } else {
      throw const GeneralException(message: 'cannot get users data');
    }
  }
}
