import 'package:flutter/material.dart';

class GraphScreen extends StatefulWidget {
  GraphScreen({Key? key}) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text('Graph'),
    ));
  }
}
