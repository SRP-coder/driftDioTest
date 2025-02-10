import 'package:dio/dio.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  // 🔹 Fetch users from API
  Future<List<UserModel>> fetchUsers() async {
    final response = await _dio.get('/users');
    List<dynamic> data = response.data;
    return data.map((json) => UserModel.fromJson(json)).toList();
  }
}
