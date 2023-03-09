import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:thread/app/data/Entity_employee.dart' show Entity_employee;

import '../../objectbox.g.dart' show Entity_employee_, Query, openStore;

class DatabaseService {
  static late var store;
  static Future<void> initializeDb() async {
    final docsDir = await getApplicationDocumentsDirectory();

    store = await openStore(
      directory: '${docsDir.path}/sampledatabase',
    );
  }

  InsertUpdateEmployee({required Entity_employee model}) {
    store.box<Entity_employee>().put(model);
  }

  DeleteEmployee({required int rowid}) {
    store.box<Entity_employee>().remove(rowid);
  }

  List<Entity_employee> GetAllEmployee() {
    return store.box<Entity_employee>().getAll();
  }

  List<Entity_employee> GetSearchEmployee({required String Searchkey}) {
    Query<Entity_employee> query = store
        .box<Entity_employee>()
        .query(Entity_employee_.name.contains(Searchkey))
        .build();
    return query.find();
  }
}
