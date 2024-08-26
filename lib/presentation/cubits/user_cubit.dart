import 'package:bloc/bloc.dart';
import 'package:flutter_prueba1/data/models/userModel.dart';
import './user_state.dart';
import '../../data/repositories/userRepository.dart';

class UserCubit extends Cubit<UserState>{
  final UserRepository userRepository;
  UserCubit(this.userRepository):super(UserInitial());

  void getAll()async{
    try {
      emit(UserLoading());
      final users = await userRepository.getAllUsers();
      emit(UserSuccess(user: users));      
    } catch (e) {
      emit(UserError(message: 'Error en el get: $e'));
    }
  }

  void addUser(UserModel user)async{
    try {
      emit(UserLoading());
      await userRepository.addUser(user);
      getAll();
    } catch (e) {
      emit(UserError(message: 'Error en add: $e'));      
    }
  }

  void updateUser(int id, UserModel user)async{
    try {
      emit(UserLoading());
      await userRepository.updateUser(id, user);
      getAll();
    } catch (e) {
      emit(UserError(message: 'Error en update: $e'));
    }
  }

  void deleteUser(int id)async{
    try {
      emit(UserLoading());
      await userRepository.deleteUser(id);
      getAll();
    } catch (e) {
      emit(UserError(message: 'Error en delete: $e'));
    }
  }
}