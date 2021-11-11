import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cama.dart';

class ApiService {
  final String url =
      'https://parcial20211109232842.azurewebsites.net/api/Camas';
  // GET FUNCTION
  Future<List<Cama>> getCamas() async {
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      return (jsonResponse as List)
          .map((data) => new Cama.fromJson(data))
          .toList();
    }

    throw Exception('No se, ta mal');
  }

  // GET id FUNCTION
  Future<Cama> getCama(int id) async {
    var response = await http.get(Uri.parse(url + '/$id'), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      print('DATOS');
      print(jsonResponse['id']);
      print(jsonResponse['estado']);

      return new Cama.fromJson(jsonResponse);
    }

    throw Exception('No se, ta mal');
  }

  // POST FUNCTION
  Future<void> postCama(Cama cama) async {
    Map data = {
      "idCama": 0,
      "estado": cama.estado,
      "idPiso": cama.idPiso,
      "idPaciente": cama.idPaciente,
      "nombre": cama.nombre,
      "fechaHoraIngreso": cama.fechaIngreso,
      "diagnostico": cama.diagnostico,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        //"Accept": "text/plain",
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201)
      print('xd');
    //return Cama.fromJson(json.decode(response.body));
    else
      throw Exception('No se, ta mal');
  }

  // PUT FUNCTION
  Future<void> putCama(int? id, Cama? cama) async {
    Map data = {
      "idCama": id,
      "estado": cama?.estado,
      "idPiso": cama?.idPiso,
      "idPaciente": cama?.idPaciente,
      "nombre": cama?.nombre,
      "fechaHoraIngreso": cama?.fechaIngreso,
      "diagnostico": cama?.diagnostico,
    };

    final response = await http.put(
      Uri.parse(url + '/$id'),
      headers: {
        //"Accept": "text/plain",
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 204) throw Exception('No se, ta mal');
  }

  // DELETE FUNCTION
  Future<void> deleteCama(int? id) async {
    final response = await http.delete(
      Uri.parse(url + '/$id'),
      headers: {
        //"Accept": "text/plain",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode != 204) throw Exception('No se, ta mal');
  }
}
