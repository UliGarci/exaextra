import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prueba1/data/models/userModel.dart';
import 'package:flutter_prueba1/presentation/cubits/user_state.dart';
import 'package:flutter_prueba1/presentation/screens/adduserscreen.dart';
import 'package:flutter_prueba1/presentation/screens/deleteuserscreen.dart';
import 'package:flutter_prueba1/presentation/screens/updateuserscreen.dart';
import './presentation/cubits/user_cubit.dart';
import './data/repositories/userRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen',
      initialRoute: '/',
      routes: {
        UserListScreen.ROUTE: (context) => BlocProvider(
              create: (context) => UserCubit(UserRepository())..getAll(),
              child: UserListScreen(),
            ),
        Adduserscreen.ROUTE: (context) => BlocProvider(
              create: (context) => UserCubit(UserRepository()),
              child: Adduserscreen(),
            ),
        DeleteUserScreen.ROUTE: (context) => BlocProvider.value(
              value: context.read<UserCubit>(),
              child: DeleteUserScreen(
                  user:
                      ModalRoute.of(context)!.settings.arguments as UserModel),
            ),
        Updateuserscreen.ROUTE: (context) => BlocProvider.value(
              value: context.read<UserCubit>(),
              child: Updateuserscreen(
                  user:
                      ModalRoute.of(context)!.settings.arguments as UserModel),
            ),
      },
    );
  }
}

class UserListScreen extends StatelessWidget {
  static const String ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
      ),
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: Text('CARGANDO...'));
        } else if (state is UserSuccess) {
          return ListView.builder(
            itemCount: state.user.length,
            itemBuilder: (context, index) {
              final user = state.user[index];
              return ListTile(
                leading: Image.network(
                    'https://rickandmortyapi.com/api/character/avatar/234.jpeg'),
                title: Text(user.title),
                subtitle: Text(user.body),
                trailing: Column(
                  mainAxisSize: MainAxisSize
                      .min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Updateuserscreen(user: user)
                            ),
                        );
                      },
                      child: Text('Actualizar'),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteUserScreen(user:user)));
                      },
                      child:
                          Text('Eliminar'),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is UserError) {
          return Center(
            child: Text('Error al jalar los usuarios= ${state.message} '),
          );
        } else {
          return Center(
            child: Text('No hay usuarios disponibles'),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/add')},
        child: Icon(Icons.add),
      ),
    );
  }
}
