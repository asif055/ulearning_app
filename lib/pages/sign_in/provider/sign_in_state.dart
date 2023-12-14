class SignInState {
  final String email;
  final String password;

  const SignInState({
    this.email = '',
    this.password = '',
  });

  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      // after this ?? , this.username take the previous value from memory

      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
