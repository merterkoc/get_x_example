import 'package:flutter/material.dart';
import 'package:get_x/model/record.dart';
import 'package:get_x/view_model/controller.dart';
import 'package:get/get.dart';
import 'package:get_x/widget/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;
    return Obx(
      () => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _controller.addRecord();
              },
            ),
            Container(
                height: 500,
                width: double.infinity,
                child: _controller.records.isNotEmpty
                    ? ListView(
                        physics: const BouncingScrollPhysics(),
                        children: records.map((record) {
                          return RecordListTile(
                            record: record,
                          );
                        }).toList(),
                        //..._controller.records.map((record) => Text('data')),
                      )
                    : Center(child: Text("Lütfen bir kayıt giriniz"))),
          ],
        ),
      ),
    );
  }
}
