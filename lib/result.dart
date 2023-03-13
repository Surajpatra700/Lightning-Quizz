import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final value;
  const ResultPage({super.key, required this.value});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Your Score is ${widget.value} out of 12",style: TextStyle(fontSize: 19)),
      ),
    );
  }
}
