import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class PremiumRepository {
  PremiumRepository._();

  static final PremiumRepository instance = PremiumRepository._();

  static const _dbName = 'zenpulse_premium.db';
  static const _tableName = 'premium_state';
  static const _keyIsPremium = 'is_premium';

  Database? _db;

  Future<void> _ensureDb() async {
    if (_db != null) return;

    try {
      final databasesPath = await getDatabasesPath();
      final path = p.join(databasesPath, _dbName);

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE $_tableName (
              key TEXT PRIMARY KEY,
              value INTEGER NOT NULL
            )
          ''');
        },
      );
    } on MissingPluginException {
      // Плагин sqflite не инициализировался (например, при hot-reload или в тестах).
      // В этом случае молча работаем без базы: состояние подписки будет только в памяти.
      _db = null;
    }
  }

  Future<bool> loadIsPremium() async {
    await _ensureDb();
    final db = _db;
    if (db == null) {
      return false;
    }

    final result = await db.query(
      _tableName,
      where: 'key = ?',
      whereArgs: [_keyIsPremium],
      limit: 1,
    );

    if (result.isEmpty) {
      return false;
    }

    final value = result.first['value'] as int;
    return value == 1;
  }

  Future<void> saveIsPremium(bool isPremium) async {
    await _ensureDb();
    final db = _db;
    if (db == null) {
      return;
    }

    await db.insert(
      _tableName,
      {
        'key': _keyIsPremium,
        'value': isPremium ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

