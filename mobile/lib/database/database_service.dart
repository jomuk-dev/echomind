import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/photo_model.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'echomind.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE photos(
        asset_id TEXT PRIMARY KEY,
        created_at TEXT
      )
    ''');
  }

  Future<void> insertPhoto(PhotoModel photo) async {
    final db = await database;

    await db.insert(
      'photos',
      photo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<PhotoModel>> getPhotos() async {
    final db = await database;

    final maps = await db.query('photos');

    return maps.map((map) => PhotoModel.fromMap(map)).toList();
  }
}