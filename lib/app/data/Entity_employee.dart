import 'package:objectbox/objectbox.dart';

@Entity()
class Entity_employee {
  @Id()
  int id = 0;
  String name;
  int age;
  String address;
  Entity_employee(
      {this.id = 0,
      required this.name,
      required this.address,
      required this.age});
}
