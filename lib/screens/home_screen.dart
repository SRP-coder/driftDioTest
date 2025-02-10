import 'package:flutter/material.dart';
import '../core/database.dart';
import '../core/dao/users_dao.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  final AppDatabase database;
  final ApiService apiService;

  HomeScreen({required this.database, required this.apiService});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UsersDao usersDao;

  @override
  void initState() {
    super.initState();
    usersDao = widget.database.usersDao;
  }

  Future<void> fetchAndStoreUsers() async {
    List<UserModel> users = await widget.apiService.fetchUsers();
    for (var user in users) {
      await usersDao.insertUser(user);
    }
    setState(() {});
  }

  Future<List<UserModel>> getLocalUsers() async {
    return await usersDao.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drift & Dio Demo')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: fetchAndStoreUsers,
            child: Text('Fetch & Save Users'),
          ),
          Expanded(
            child: FutureBuilder<List<UserModel>>(
              future: getLocalUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                final users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
