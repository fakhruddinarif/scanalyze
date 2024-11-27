import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanalyze_app/blocs/user/user_event.dart';
import 'package:scanalyze_app/blocs/user/user_state.dart';
import 'package:scanalyze_app/controllers/user_controller.dart';
import 'package:scanalyze_app/models/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserController userController;

  UserBloc({required this.userController}) : super(UserInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final response = await userController.register(RegisterUserRequest(name: event.name, email: event.email, password: event.password));
        emit(UserSuccess(message: response['message'], data: response['data']));
      } catch (e) {
        emit(UserFailure(message: e.toString()));
      }
    });
  }
}