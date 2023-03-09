                                                                                                  import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:thread/app/data/DatabaseService.dart';
import 'package:thread/app/data/Entity_employee.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initializeDb();
  var data = Entity_employee(name: 'heloo', address: 'add', age: 12);
  DatabaseService().InsertUpdateEmployee(model: data);
  var modeldata = DatabaseService().GetAllEmployee();

  for (var a in modeldata) {
    print(a.id);
    print(a.address);
    print(a.name);
    print('======');
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}



// void main() async {
//   fun1().then((value) => fun3());
//   fun2();
// }

// Future<void> fun1() async {
//   await Future.delayed(Duration(seconds: 3));
//   print('function 1');
// }

// Future<void> fun2() async {
//   await Future.delayed(Duration(seconds: 2));
//   print('function 2');
// }

// Future<void> fun3() async {
//   await Future.delayed(Duration(seconds: 1));
//   print('function 3');
// }
