import 'cama.dart';
import 'api_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CrearCama extends StatefulWidget {
  @override
  _CrearCamaState createState() => _CrearCamaState();
}

class _CrearCamaState extends State<CrearCama> {
  ApiService apiService = ApiService();
  final TextEditingController _piso = TextEditingController();
  final TextEditingController _nombrePaciente = TextEditingController();
  final TextEditingController _idPaciente = TextEditingController();
  final TextEditingController _diagnostico = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir cama'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.bed, size: 150, color: Colors.blue),
                Text(
                  'ID Habitacion: Automático',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 50.0),
                TextFormField(
                  controller: _piso,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Piso',
                  ),
                ),
                SizedBox(height: 20.0),
                CheckboxListTile(
                  title: Text('¿Cama ocupada?'),
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                Text(
                  'Datos del paciente',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _nombrePaciente,
                  enabled: value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _idPaciente,
                  enabled: value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _diagnostico,
                  enabled: value,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Diagnóstico',
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Cama newCama = Cama(
                          idCama: 1,
                          estado: value ? 1 : 0,
                          idPiso: int.parse(_piso.text.toString()),
                          idPaciente: _idPaciente.text.toString(),
                          nombre: _nombrePaciente.text.toString(),
                          fechaIngreso: DateTime.now().toString(),
                          diagnostico: _diagnostico.text.toString(),
                        );
                        apiService.postCama(newCama);
                      },
                      child: Text('Crear'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
