import 'package:flutter/material.dart';
import 'package:get_x/model/record.dart';
import 'package:get_x/view_model/controller.dart';
import 'package:get/get.dart';

class RecordListTile extends StatelessWidget {
  final Record record;
  RecordListTile({Key? key, required this.record}) : super(key: key);
  final Controller _controller = Get.find(); //Get/get import

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14),
        child: ListTile(
          leading: _buildDate(),
          title: _buildWeight(),
          trailing: _buildIcons(),
        ),
      ),
    );
  }

  Row _buildIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: null, icon: Icon(Icons.edit)),
        IconButton(
            onPressed: () {
              _controller.removeRecord(record);
            },
            icon: Icon(Icons.delete, color: Colors.red)),
      ],
    );
  }

  Center _buildWeight() {
    return Center(
        child: Text(
      record.weight.toString(),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
  }

  Column _buildDate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(record.dateTime.day.toString()),
      ],
    );
  }
}
