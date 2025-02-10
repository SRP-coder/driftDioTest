import 'package:flutter/material.dart';
import 'core/database.dart';
import 'services/api_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppDatabase database = AppDatabase();
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift & Dio Demo',
      home: HomeScreen(database: database, apiService: apiService),
    );
  }
}
