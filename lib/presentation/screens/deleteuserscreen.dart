import 'package:flutter/material.dart';
import 'package:flutter_prueba1/data/models/userModel.dart';
import 'package:flutter_prueba1/main.dart';
import 'package:flutter_prueba1/presentation/cubits/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DeleteUserScreen extends StatefulWidget {
  static const ROUTE = '/delete';
  final UserModel user;
  DeleteUserScreen({required this.user});

  @override
  _DeleteuserScreen createState()=>_DeleteuserScreen();
}

class _DeleteuserScreen extends State<DeleteUserScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eliminar usuario'),),
      body: Column(
        children: [
          Center( child: Text('Estas seguro de eliminar el ${widget.user.title}?')),
          Row(
            children: [
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancelar')),
              ElevatedButton(onPressed: (){
                  context.read<UserCubit>().deleteUser(widget.user.id??1);
                  Navigator.pop(context);
                }, child: Text('Eliminar')),
            ],
          )
        ],
      ),
    );
  }
}