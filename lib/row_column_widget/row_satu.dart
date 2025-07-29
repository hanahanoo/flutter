import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class RowOne extends StatelessWidget {
  const RowOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Row Satu',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Text Widget 1'),
          Text('Text Widget 2'),
          Text('Text Widget 3'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('text 1'), Text('text 2')
          ],)
        ],
      ), 
      );
  }
}