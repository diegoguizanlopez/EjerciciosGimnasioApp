import 'package:flutter/material.dart';

class DeffaultScaffold extends StatefulWidget {
  Widget body;
  String? name;
  DeffaultScaffold({Key? key,required this.body,this.name}) : super(key: key);

  @override
  _DeffaultScaffoldState createState() => _DeffaultScaffoldState();
}

class _DeffaultScaffoldState extends State<DeffaultScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(widget.name??"Gym Excercise"),
      ),
      body: widget.body,
    );
  }
}
