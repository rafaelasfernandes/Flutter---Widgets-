import 'package:carros_flutter/models/carro.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CarroService {
  static Future<List<Carro>> getCarros() async {
    final url = "http://livrowebservices.com.br/rest/carros";
    print("> get: $url");

    final response = await http.get(url);


    final mapCarros = json.decode(response.body).cast<Map<String, dynamic>>();

    final carros = mapCarros.map<Carro>((json) => Carro.fromJson(json))
        .toList();

    return carros;
  }
}