import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserRegisterEvent extends UserEvent {
  final String name;
  final String email;
  final String password;

  const UserRegisterEvent({required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}

class UserLoginEvent extends UserEvent {
  final String email;
  final String password;

  const UserLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class UserUpdateEvent extends UserEvent {
  final String name;
  final String email;
  final String password;

  const UserUpdateEvent({required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}

class UserDeleteEvent extends UserEvent {
  final String id;

  const UserDeleteEvent({required this.id});

  @override
  List<Object> get props => [id];
}