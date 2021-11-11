import 'creacion.dart';
import 'list_view.dart';
import 'package:flutter/material.dart';

class ListaCamas extends StatefulWidget {
  const ListaCamas({Key? key}) : super(key: key);

  @override
  _ListaCamasState createState() => _ListaCamasState();
}

class _ListaCamasState extends State<ListaCamas> {
  actualizar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: CamaListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CrearCama()),
          ).then((value) => actualizar());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
