import 'dart:convert';
import 'dart:io';

class Person {
  late int id;
  late String first_name;
  late String last_name;
  late String email;
  late String ip_address;
  late int age;
  bool? can_drink;
  String? full_name;

  Person(dynamic data) {
    id = data['id'];
    first_name = data['first_name'];
    last_name = data['last_name'];
    email = data['email'];
    ip_address = data['ip_address'];
    age = data['age'];

    can_drink = age > 18;
    full_name = "${first_name} ${last_name}";
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'ip_address': ip_address,
      'age': age,
      'can_drink': can_drink,
      'full_name': full_name
    };
  }
}

void task(int i) async {
  var file = File("../data.json");
  var data = await file.readAsString();
  var parsed =
      (jsonDecode(data) as List<dynamic>).map((e) => Person(e)).toList();
  parsed.sort((a, b) => a.age.compareTo(b.age));
  var serialized = jsonEncode(parsed.map((e) => e.toJson()).toList());
  var saveFile = File("results/result-${i}.json");
  var sink = saveFile.openWrite();
  sink.write(serialized);
  await sink.flush();
  await sink.close();
}

void main() async {
  for (var i = 0; i < 1000; i++) {
    task(i);
  }
}
