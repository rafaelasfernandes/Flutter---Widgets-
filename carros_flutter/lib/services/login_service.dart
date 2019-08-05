import 'dart:convert';
import 'package:carros_flutter/domain/response.dart';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<Response> login(String login, String senha) async {
    var url = "http://livrowebservices.com.br/rest/login";

    final response = await http.post(url, body: {"login": login, "senha": senha});
    final s = response.body;
    print(s); // esse "s" vai ser o json

    final r = Response.fromJson(json.decode(s));

    return r;
  }
}
