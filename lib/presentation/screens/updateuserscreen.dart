import 'package:flutter/material.dart';
import 'package:flutter_prueba1/data/models/userModel.dart';
import 'package:flutter_prueba1/presentation/cubits/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Updateuserscreen extends StatefulWidget {
  static const String ROUTE = '/update';
  final UserModel user;
  Updateuserscreen({required this.user});
  @override
  _Updateuserscreen createState()=> _Updateuserscreen();
}

class _Updateuserscreen extends State<Updateuserscreen>{
  final _key = GlobalKey<FormState>();
  late TextEditingController _title;
  late TextEditingController _body;
  late TextEditingController _userId;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.user.title);
    _body = TextEditingController(text: widget.user.body);
    _userId = TextEditingController(text: widget.user.userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Actualizar usuario'),),
      body: Form(child: Column(children: [
        TextFormField(controller: _title, decoration: InputDecoration(labelText: 'Titulo'),),
        TextFormField(controller: _body, decoration: InputDecoration(labelText: 'Cuerpo'),),
        TextFormField(controller: _userId, decoration: InputDecoration(labelText: 'User id'),),
        ElevatedButton(onPressed: (){
          final user = UserModel(userId: int.parse(_userId.text), title: _title.text, body: _body.text);
          context.read<UserCubit>().updateUser(widget.user.id??1, user);
          Navigator.pop(context);
        }, child: Text('Actualizar'))
      ],)),
    );
  }
}