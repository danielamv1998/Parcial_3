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

      for (var item in jsonResponse) {
        print('===CAMA===');
        print('ID CAMA: ' + item['idCama'].toString());
        print('ESTADO: ' + item['estado'].toString());
        print('ID PISO: ' + item['idPiso'].toString());
        if (item['idPaciente'].toString().isNotEmpty ||
            item['idPaciente'] != '') {
          print('===PACIENTE===');
          print('PACIENTE: ' + item['idPaciente'].toString());
          print('NOMBRE: ' + item['nombre'].toString());
          print('FECHA: ' + item['fechaHoraIngreso'].toString());
          print('DIAGNOSTICO: ' + item['diagnostico'].toString());
        }
      }

      return (jsonResponse as List)
          .map((data) => new Cama.fromJson(data))
          .toList();
    }

    throw Exception('No se, ta mal');
  }
  // GET id FUNCTION

  // POST FUNCTION

  // PUT FUNCTION

  // DELETE FUNCTION
}
