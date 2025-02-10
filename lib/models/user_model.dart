import 'package:drift/drift.dart';
import '../core/database.dart';

class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  // 🔹 Convert from JSON (for API responses)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  // 🔹 Convert to JSON (for API requests),hit post request
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // Convert to Drift (for inserting into local DB)
  UsersCompanion toDrift() {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
    );
  }

  // Convert from Drift (for retrieving from local DB)
  factory UserModel.fromDrift(User data) {
    return UserModel(
      id: data.id,
      name: data.name,
      email: data.email,
    );
  }
}
