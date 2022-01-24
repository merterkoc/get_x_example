import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({Key? key}) : super(key: key);

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _currentValueWeight = 70;
  DateTime _currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Record'),
      ),
      body: Column(children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.weight),
                Stack(alignment: Alignment.bottomCenter, children: [
                  NumberPicker(
                    minValue: 35,
                    maxValue: 150,
                    value: _currentValueWeight,
                    axis: Axis.horizontal,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _currentValueWeight = value;
                      });
                    },
                  ),
                  const Icon(FontAwesomeIcons.chevronUp,
                      color: Colors.blue, size: 16),
                ]),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            var initialDate = DateTime.now();

            showDatePicker(
              builder: (context, child) => Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    onBackground: Colors.red,
                  ),
                ),
                child: child ?? Text(''),
              ),
              context: context,
              initialDate: _currentDate,
              firstDate: initialDate.subtract(const Duration(days: 365)),
              lastDate: initialDate.add(const Duration(days: 30)),
            ).then((value) {
              setState(() {
                _currentDate = value as DateTime;
              });
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.calendar,
                    size: 30,
                  ),
                  Expanded(
                    child: Text(
                      DateFormat('EEEE,MMMM, d, y').format(_currentDate),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Text('Note Card'),
        ),
        ElevatedButton(
          onPressed: () {
            //   print('object');
          },
          child: Text('Save Record'),
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ]),
    );
  }
}
