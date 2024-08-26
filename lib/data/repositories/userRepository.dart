import 'dart:convert';

import 'package:flutter_prueba1/data/models/userModel.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  final String urlApi ='https://jsonplaceholder.typicode.com/posts';

  // OBTENER LISTA DE USUARIOS
  Future<List<UserModel>> getAllUsers() async{
    final response = await http.get(Uri.parse(urlApi));
    print('GetAllUsers: $response');
    if(response.statusCode == 200){
      List<dynamic> data = jsonDecode(response.body);
      return data.map((user)=>UserModel.fromJson(user)).toList();
    }else{
      throw Exception('Error al obtener los usuarios');
    }
  }

  // AGREGAR USUARIO
  Future<void> addUser(UserModel user) async{
    final response = await http.post(Uri.parse(urlApi),body: jsonEncode(user.toJson()));
    print('AGREGAR: ${response.body}');
    if(response.statusCode!=201){
      throw Exception('Error al registrar usuario');
    }
  }

  // ACTUALIZAR USUARIO
  Future<void> updateUser(int id, UserModel user) async{
    final response = await http.put(Uri.parse('$urlApi/$id'),body: jsonEncode(user.toJson()));
    if(response.statusCode!=201){
      throw Exception('Error al actualizar usuario');
    }
  }

  // ELIMINAR USUARIO
  Future<void> deleteUser(int id)async{
    final response = await http.delete(Uri.parse('urlApi$id'));
    if(response.statusCode!=201){
      throw Exception('Error al eliminar el usuario');
    }
  }
}