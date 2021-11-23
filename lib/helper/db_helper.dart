import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    //* Open the Database for adding and extracting the data. If database does not exist, create a new one
    /**
     * * openDatabase returns a Future<Database> type data. It gives us access to the database actually.
     * * After getting access to the database, we can insert the data provided to us
     */
    return openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await getDatabase();

    await database.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> fetch(String table) async {
    final database = await getDatabase();
    return database.query(table);
  }
}
