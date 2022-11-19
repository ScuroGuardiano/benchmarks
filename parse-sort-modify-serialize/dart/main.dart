import 'dart:convert';
import 'dart:io';

void task(int i) async {
  var file = File("../data.json");
  var data = await file.readAsString();
  var parsed = jsonDecode(data) as List<dynamic>;
  parsed.sort((a, b) => a['age'].compareTo(b['age']));
  parsed.forEach((element) {
    element["full_name"] = "${element['first_name']} ${element['last_name']}";
    element["can_drink"] = element['age'] > 18;
  });
  var serialized = jsonEncode(parsed);
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
