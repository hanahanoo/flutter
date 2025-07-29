import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class ColumnSatu extends StatelessWidget {
  const ColumnSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Column Bro', 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Text Widget 1'),
          Text('Text Widget 2'),
          Text('Text Widget 3'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('Text Row Widget 1'), Text('Text Row Widget 2')])
        ],
        ),
      );
  }
}