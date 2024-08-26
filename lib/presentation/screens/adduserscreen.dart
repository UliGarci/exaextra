import 'package:flutter/material.dart';
import 'package:flutter_prueba1/data/models/userModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prueba1/presentation/cubits/user_cubit.dart';

class Adduserscreen extends StatefulWidget {
  static const String ROUTE ='/add';

  @override
  _Adduserscreen createState() => _Adduserscreen();
}

class _Adduserscreen extends State<Adduserscreen>{
  final _key = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _body = TextEditingController();
  final _userId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar usuario'),),
      body: Form(key: _key ,child: Column(children: [
        TextFormField(controller: _title, decoration: InputDecoration(labelText: 'Titulo'),),
        TextFormField(controller: _body,decoration: InputDecoration(labelText: 'Cuerpo'),),
        TextFormField(controller: _userId,decoration: InputDecoration(labelText: 'Id de usuario'),),
        ElevatedButton(onPressed: (){
          final user = UserModel(userId: int.parse(_userId.text), title: _title.text, body: _body.text);
          context.read<UserCubit>().addUser(user);
          Navigator.pop(context);
          },
          child: Text('Registrar'))
      ],)),
    );
  }
}