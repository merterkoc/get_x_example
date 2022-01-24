import 'package:get/get.dart';

import '../model/record.dart';

class Controller extends GetxController {
  var records = <Record>[
    // Record(dateTime: DateTime.now(), weight: 80, note: 's'),
    // Record(dateTime: DateTime.now(), weight: 80, note: 's'),
    // Record(dateTime: DateTime.now(), weight: 80, note: 's'),
    // Record(dateTime: DateTime.now(), weight: 80, note: 's'),
    // Record(dateTime: DateTime.now(), weight: 80, note: 's'),
  ].obs;
  void addRecord() {
    records.add(
        Record(dateTime: DateTime.now(), weight: 80, note: 'Eklenen deger'));

    update();
  }

  void removeRecord(Record record) {
    records.remove(record);
    update();
  }
}
