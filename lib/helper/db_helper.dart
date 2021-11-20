import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    //* Open the Database for adding and extracting the data. If database does not exist, create a new one
    /**
     * * openDatabase returns a Future<Database> type data. It gives us access to the database actually.
     * * After getting access to the database, we can insert the data provided to us
     */
    final database = await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user-places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);

    database.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
}
