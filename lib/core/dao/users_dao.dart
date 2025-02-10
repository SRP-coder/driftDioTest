import 'package:drift/drift.dart';
import '../database.dart';
import '../../models/user_model.dart';
import '../tables/users_table.dart';

part 'users_dao.g.dart';

// Annotation: @DriftAccessor(tables: [Users])
// This tells Drift that this DAO (UsersDao) is associated with the Users table.
//UsersDao: This is a DAO (Data Access Object) responsible for handling database operations for Users.
// DatabaseAccessor<AppDatabase>:
// AppDatabase is the main database class.
// DatabaseAccessor provides helper methods to interact with the database.
// _$UsersDaoMixin:
// This is a generated mixin that gives access to the Users table automatically.

//Key Benefits of _$UsersDaoMixin
// Automatic Table Access: You don’t need to manually declare the users table inside UsersDao.
//  Code Generation: It ensures that your database code remains synchronized with your schema.
// Separation of Concerns: Keeps DAO logic clean by letting Drift handle the database connections.
//How Does It Work?
// When you annotate the class with @DriftAccessor(tables: [Users]), Drift generates a file (*.g.dart).
// Inside that file, a mixin named _$UsersDaoMixin is created.
// This mixin contains a reference to the Users table, so you can use select(users), into(users), etc.
//DatabaseAccessor for generate query

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  UsersDao(AppDatabase db) : super(db);

  Future<List<UserModel>> getUsers() async {
    final userList = await select(users).get();
    return userList.map((user) => UserModel.fromDrift(user)).toList();
  }

  Future<void> insertUser(UserModel user) async {
    await into(users).insert(user.toDrift());
  }
}
