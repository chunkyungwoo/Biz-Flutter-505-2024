// ignore_for_file: constant_identifier_names, unused_field

import 'package:sqflite/sqflite.dart';

const TBL_TODO = "tbl_todolist";
const createTodoTable = """
  CREATE TABLE $TBL_TODO (
    id TEXT,
    sdate TEXT,
    stime TEXT,
    edate TEXT,
    etime TEXT,
    complete INTEGER
  )
""";

class TodoService {
  late Database _database;

  onCreateTable(db, version) async {
    return db.execute(createTodoTable);
  }

  onUpgradeTable(db, oldVersion, newVersion) async {
    final batch = db.batch();
    await batch.excute("DROP TABLE $TBL_TODO");
    await batch.excute(createTodoTable);
    await batch.commit();
  }
}
