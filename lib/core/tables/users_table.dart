import 'package:drift/drift.dart';

//Drift will automatically generate a data class named UsersData by default.
// However, if you want to rename the generated data class to something more readable (like User instead of UsersData), you use:
@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
}

//  TextColumn get name => text().named('full_name')(); // Custom column name  if i want to change the namet to anything else then i should use .named