import 'package:flutter/material.dart';
import 'package:mymedicapp/api_service.dart';

import 'cama.dart';

class DetalleCama extends StatefulWidget {
  Cama cama;
  DetalleCama(this.cama);
  @override
  _DetalleCamaState createState() => _DetalleCamaState();
}

class _DetalleCamaState extends State<DetalleCama> {
  ApiService apiService = ApiService();
  TextEditingController _textField = TextEditingController();
  TextEditingController _nombreField = TextEditingController();
  TextEditingController _idPacienteField = TextEditingController();
  TextEditingController _idPiso = TextEditingController();

  bool editable = false;
  @override
  Widget build(BuildContext context) {
    int? id = widget.cama.idCama;
    _textField.text = widget.cama.diagnostico.toString();
    _nombreField.text = widget.cama.nombre.toString();
    _idPacienteField.text = widget.cama.idPaciente.toString();
    _idPiso.text = widget.cama.idPiso.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de la cama"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Icon(Icons.bed, size: 100, color: Colors.blue),
                Text(
                  "Cama: ${widget.cama.idCama}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _idPiso,
                  enabled: editable,
                  decoration: InputDecoration(
                    labelText: "ID Piso",
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nombreField,
                  enabled: editable,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _idPacienteField,
                  enabled: editable,
                  decoration: InputDecoration(
                    labelText: "ID Paciente",
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Ingreso: ${widget.cama.fechaIngreso}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _textField,
                  enabled: editable,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Diagnóstico',
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Cama cama = Cama(
                            idCama: id,
                            estado: 1,
                            idPiso: int.parse(_idPiso.text.toString()),
                            idPaciente: _idPacienteField.text.toString(),
                            nombre: _nombreField.text.toString(),
                            fechaIngreso: widget.cama.fechaIngreso,
                            diagnostico: _textField.text,
                          );
                          if (editable) {
                            apiService.putCama(id, cama);
                            Navigator.pop(context);
                          }
                          setState(() {
                            editable = !editable;
                          });
                        },
                        child: Text(editable ? 'GUARDAR' : 'EDITAR')),
                    ElevatedButton(
                      onPressed: () {
                        Cama cama = Cama(
                          idCama: id,
                          estado: 0,
                          idPiso: int.parse(_idPiso.text.toString()),
                          idPaciente: '',
                          nombre: '',
                          fechaIngreso: '',
                          diagnostico: '',
                        );
                        apiService.putCama(id, cama);
                      },
                      child: Text('DAR DE ALTA'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        apiService.deleteCama(id);
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
