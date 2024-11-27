class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  User({required this.id, required this.name, required this.email, required this.password, required this.createdAt, required this.updatedAt, this.deletedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'deleted_at': deletedAt?.toIso8601String(),
  };
}

class RegisterUserRequest {
  final String name;
  final String email;
  final String password;

  RegisterUserRequest({required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}

class LoginUserRequest {
  final String email;
  final String password;

  LoginUserRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}

class UpdateUserRequest {
  final String name;
  final String email;
  final String password;

  UpdateUserRequest({required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}

class DeleteUserRequest {
  final String id;

  DeleteUserRequest({required this.id});

  Map<String, dynamic> toJson() => {
    'id': id,
  };
}