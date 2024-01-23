import 'dart:convert';

import 'package:guerilla_test/clients/models/client.dart';
import 'package:guerilla_test/clients/models/visits.dart';
import 'package:http/http.dart' as http;

class ClientsController {
  final http.Client httpClient;

  const ClientsController({required this.httpClient});

  Future<List<Client>> getAllClients() async {
    final res = await httpClient.get(
      Uri.parse('http://127.0.0.1:8000/patients'),
    );

    if (res.statusCode == 200) {
      final List<dynamic> json = jsonDecode(res.body);
      final clients = json.map((client) => Client.fromJson(client)).toList();
      return clients;
    }
    return [];
  }

  Future<List<Visit>> getAllClientVisits(int id) async {
    final res = await httpClient.get(
      Uri.parse('http://127.0.0.1:8000/visits/$id'),
    );

    if (res.statusCode == 200) {
      final List<dynamic> json = jsonDecode(res.body);
      final visits = json.map((visit) => Visit.fromJson(visit)).toList();
      return visits;
    }
    return [];
  }
}
