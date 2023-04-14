import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'vixi.db');
    final db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE pontos_turisticos('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'data TIMESTAMP, '
            'descricao VARCHAR(255),'
            'detalhes VARCHAR(255),'
            'diferenciais VARCHAR(255)'
            ')');
  }
}