import 'package:flutter/material.dart';
class DeleteUserScreen extends StatelessWidget {
  static const ROUTE = '/delete';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eliminar usuario'),),
      body: Column(
        children: [
          Center( child: Text('Estas seguro de eliminar el usuario?')),
          Row(
            children: [
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancelar')),
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Eliminar')),
            ],
          )
        ],
      ),
    );
  }
}