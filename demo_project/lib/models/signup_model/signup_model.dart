class SignUp {
  String name;
  String email;
  String password;

  SignUp({required this.name, required this.email, required this.password});

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };
}
