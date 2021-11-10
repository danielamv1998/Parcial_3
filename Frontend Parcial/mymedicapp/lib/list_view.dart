import 'dart:js';

import 'api_service.dart';
import 'package:flutter/material.dart';
import 'cama.dart';

class CamaListView extends StatelessWidget {
  ApiService apiService = ApiService();

  refreshState() {
    CamaListView();
  }

  @override
  Widget build(BuildContext context) {
    ListTile _tile() {
      return ListTile(
        title: Text('Cama'),
        subtitle: Text('Cama'),
        leading: Icon(Icons.add),
        onTap: () {},
      );
    }
    return null;
  }

  ListView _camaListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(
          data[index]
        )
      }
    );
  }
}
