import 'package:equatable/equatable.dart';
import '../../data/models/userModel.dart';

abstract class UserState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserInitial extends UserState{}
class UserLoading extends UserState{}
class UserSuccess extends UserState{
  final List<UserModel> user;
  UserSuccess({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
class UserError extends UserState{
  final String message;
  UserError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}