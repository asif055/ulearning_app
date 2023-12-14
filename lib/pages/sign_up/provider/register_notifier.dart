import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/pages/sign_up/provider/register_state.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build()  {
    return const RegisterState();
  }

  //for username
  void onUserNameChange(String name) {
    state = state.copyWith(username: name);
  }

  //for email
  void onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  //for password
  void onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  //for repassword
  void onUserRePasswordChange(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }
}
