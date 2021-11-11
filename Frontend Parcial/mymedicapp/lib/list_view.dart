import 'api_service.dart';
import 'package:flutter/material.dart';
import 'cama.dart';
import 'detalles.dart';

// ignore: must_be_immutable
class CamaListView extends StatefulWidget {
  @override
  _CamaListViewState createState() => _CamaListViewState();
}

class _CamaListViewState extends State<CamaListView> {
  ApiService apiService = ApiService();

  actualizar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ListTile _tile(int idCama, int estado, int idPiso, String idPaciente,
        String nombre, String fechaHoraIngreso, String diagnostico) {
      Cama cama = Cama(
        idCama: idCama,
        estado: estado,
        idPiso: idPiso,
        idPaciente: idPaciente,
        nombre: nombre,
        fechaIngreso: fechaHoraIngreso,
        diagnostico: diagnostico,
      );
      return ListTile(
        title: Text(
          estado == 0 ? 'Cama $idCama libre' : 'Cama $idCama ocupada',
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text('IDP: $idPaciente'),
        leading: Icon(
          Icons.airline_seat_individual_suite_rounded,
          color: estado == 0 ? Colors.green : Colors.red,
        ),
        isThreeLine: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalleCama(cama),
            ),
          ).then((value) => actualizar());
        },
      );
    }

    ListView _camasListView(data) {
      if (data.length == 0) {
        return ListView(
          children: <Widget>[
            ListTile(
              title: Text('No hay camas disponibles'),
              subtitle: Text('Por favor, registra una para empezar'),
            )
          ],
        );
      }
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(
            data.elementAt(index).idCama,
            data.elementAt(index).estado,
            data.elementAt(index).idPiso,
            data.elementAt(index).idPaciente,
            data.elementAt(index).nombre,
            data.elementAt(index).fechaIngreso,
            data.elementAt(index).diagnostico,
          );
        },
      );
    }

    return FutureBuilder<List<Cama>>(
      future: apiService.getCamas(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Cama>? data = snapshot.data;
          return _camasListView(data);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
